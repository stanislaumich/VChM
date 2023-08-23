********************************************
TNPDF - PDF VCL for Delphi 1,2,3,4,5...
Version 2.0
Copyright (c) 2002, K. Nishita 

                     Readme File
********************************************

TNPDF (TNPDF.PAS) is a Delphi Native VCL to create Adobe Acrobat PDF Files which 
works like Delphi's TPrinter.   This VCL was tested on D1, D2, D4.  It should work on D3 and D5.

I wrote this VCL to use one of my project, and I made it to public hoping someone 
will improve on it....    This VCL is free to use for any purpose as long as

1. You mention My Name (K. Nishita)  somewhere in you software and documentation,
2. If you improve this VCL, make your improved version available in public,
3. Use this VCL with your own risk,
4. You send me an e-mail to let me know that you are using this VCL,
5. and you like this VCL.

Not all the PDF features are supported.  I implemented just enough features 
to use in my project.  I made source code available to you all so that you can improve 
or fix any bugs by yourself.  Please take a look at my example project for the VCL usage.

This update includes, FlateDecode/Zlib compression using NOMSSI NZALI Jacques H. C.'s paszlib.
Please check the Paszlib home page with the link:  http://www.tu-chemnitz.de/~nomssi/paszlib.html

NOTE:
If you want to use FlateDecode/Zlib compression, copy paszlib files (paszlib.zip) 
included with this distribution to your Delphi librally path.

Known Problems:
1. Image Routine is not quite right...  Since I did not really implement the palette and 
    stuff (these are over my head...), bitmap color may not be displyed correctly.
2. If you find more problems, please fix yourself...

Thanks,
K. Nishita
info@nishita.com


Copyright (c) 2002, K. Nishita 

This software is provided 'as-is', without any express or implied warranty. 
In no event will the author be held liable for any damages arising from the use 
of this software.
