Docker for [wambam](https://github.com/rlorigro/wambam), a tool to get some QC metrics from alignment. 

Use with:

```sh
wam -i reads.bam -o wambam_results
```

`wambam_results` being the name the output directory that will be created (must not exist). 
It will contain a file `identity_distribution.csv` with the distribution of the identity score across reads.
