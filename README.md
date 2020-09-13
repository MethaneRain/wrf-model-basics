# wrf-model-basics
Repo to document my journey into atmospheric modeling with WRF and related models

---

As my career in the atmospheric sciences has evolved, I've noticed that both my desire and my skillset have tended towards numerical modeling. Without a higher degree (Masters or PhD) I've been unable to gain experience and have not been qualified to pursue jobs that require model experience. 

So I made a decision that I wanted to build and compile the WRF model on my personal computer. Obviously I won't be able run super complex runs and I can't run multiple processors and/or nested domains. With that said, I still could gain the basics if I could get the WRF running. With the help of NCAR's <a href=https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compilation_tutorial.php>MMM compilation tutorial</a> and numerous others online, I have figured I could actually make this happen.

---


Luckily I had already had Fortran and C compilers up and running on my computer for working with Fortran scripts not too long ago, as well as having NetCDF installed which is fundamental for working with the WRF program. However, I still ran into some hurdles trying to make sure all the ```PATHS``` were pointing to the correct locations for the gcc and gfortran since I upgraded the stock Mac versions from Macports to Homebrew. The workaround this for me was to make alias for the command line paths for ```gcc``` and ```gfortran``` in my ```.bash_profile``` to point to where Brew installs the updated gcc compilers.






