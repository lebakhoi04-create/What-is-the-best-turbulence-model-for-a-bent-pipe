#!/usr/bin/env python3
"""
Convert OpenFOAM omega + k fields to epsilon using:
    epsilon = C_mu * k * omega
where C_mu = 0.09 (standard k-epsilon constant)
"""

import re
import sys
import os

C_MU = 0.09

def read_foam_scalar_field(filepath):
    """Read an OpenFOAM ASCII scalarField file.
    Returns (header_lines, values, footer_lines).
    """
    with open(filepath, 'r') as f:
        content = f.read()

    # Split into header, data block, footer
    # Find the opening parenthesis of the data block
    match = re.search(r'(\d+)\n\(', content)
    if not match:
        raise ValueError(f"Could not find data block in {filepath}")

    n_values = int(match.group(1))
    block_start = match.start()
    paren_open = content.index('\n(\n', block_start) + 3  # after '(\n'

    # Find closing paren
    paren_close = content.index('\n)', paren_open)

    header = content[:block_start]
    data_str = content[paren_open:paren_close]
    footer = content[paren_close:]  # includes '\n)' onward

    values = [float(v) for v in data_str.split()]
    if len(values) != n_values:
        raise ValueError(f"Expected {n_values} values, got {len(values)} in {filepath}")

    return header, values, footer, n_values


def write_foam_scalar_field(filepath, header, values, footer, object_name):
    """Write an OpenFOAM ASCII scalarField file."""

    # Replace the 'object' line in the header to reflect new field name
    header = re.sub(r'(object\s+)\S+;', rf'\g<1>{object_name};', header)
    # Update location comment if present (optional, cosmetic)
    header = re.sub(r'(location\s+"[^"]*)/[^/"]+"', rf'\g<1>/"', header)

    with open(filepath, 'w') as f:
        f.write(header)
        f.write(f'{len(values)}\n(\n')
        for v in values:
            f.write(f'{v:.6g}\n')
        f.write(footer)

    print(f"  Written {len(values)} values to: {filepath}")


def main():
    # --- Paths: edit these if needed ---
    k_file     = 'k'
    omega_file = 'omega'
    eps_file   = 'epsilon'
    # ------------------------------------

    # Allow overriding paths via command-line args
    if len(sys.argv) == 4:
        k_file, omega_file, eps_file = sys.argv[1], sys.argv[2], sys.argv[3]
    elif len(sys.argv) != 1:
        print("Usage: python make_epsilon.py [k_file omega_file epsilon_out]")
        sys.exit(1)

    print(f"Reading k     : {k_file}")
    print(f"Reading omega : {omega_file}")

    k_header, k_vals, k_footer, n = read_foam_scalar_field(k_file)
    _, omega_vals, _, n2 = read_foam_scalar_field(omega_file)

    if n != n2:
        raise ValueError(f"Point count mismatch: k has {n}, omega has {n2}")

    print(f"  Found {n} face values in each field.")
    print(f"  Computing epsilon = {C_MU} * k * omega ...")

    epsilon_vals = [C_MU * k * w for k, w in zip(k_vals, omega_vals)]

    print(f"  epsilon range: [{min(epsilon_vals):.4g}, {max(epsilon_vals):.4g}]")

    write_foam_scalar_field(eps_file, k_header, epsilon_vals, k_footer, 'epsilon')
    print("Done.")


if __name__ == '__main__':
    main()
