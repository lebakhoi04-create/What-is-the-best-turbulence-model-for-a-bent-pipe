The meshes for all of these cases have been omitted due to GitHub's file size limits. You can regenerate them using the appropriate .geo files located in the CAD folder of each turbulent case. Please contact me if you need the original mesh files.

For the LES straight pipe simulation, I have included a setFieldsDict file to impose an artificial initial condition. This encourages early turbulence formation and accelerates the development of the pipe flow.

For the LES curved pipe simulation, under CaseFile/Constant/boundaryData/inlet, you will find that it is empty. If you really want to replicate this, please download the full inlet profile from this Google Drive link: [https://drive.google.com/file/d/1OV72D-nsEUVRrv4sKK9PuQz26r4dlG4B/view?usp=sharing](https://drive.google.com/file/d/1OV72D-nsEUVRrv4sKK9PuQz26r4dlG4B/view?usp=sharing). The file is 5 GB big and contains 5.7k files. That is why I cannot upload it onto GitHub.
