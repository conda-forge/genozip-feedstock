Genozip
=======  
  
(available on **Conda**, **Docker Hub** and https://github.com/divonlan/genozip)  
  
**Genozip** is a compressor for genomic files - while it can compress any file (i.e. not only genomic files), it is optimized to compress FASTQ, SAM/BAM/CRAM, VCF/BCF, FASTA, GVF and 23andMe files. It can even compress them if they are already compressed with .gz .bz2 .xz (for full list of supported file types see 'genozip --help=input').  
  
The compression ratio depends on the data being compressed, and you can usually expect about a 1.5-3X ratio when compressing .bam, 2X-5X for .fastq.gz files (i.e. compressing already-compressed files), and up to 200X when compressing an uncompressed high-sample-count .vcf file with only GT data.  
  
**Sign up** to receive low-frequency updates related to Genozip: https://tinyurl.com/genozip  
  
The compression is lossless - the decompressed file is 100% identical to the original file.  
Notes:   
1. Losslessness when the original file is already compressed (with .gz, .bz2 or .xz as well as .bam) is relative to the underlying uncompressed file. If the original file was compressed with BGZF (as in BAM and most genomic files with a .gz extension) - genounzip will re-compresses the file with BGZF upon decompression (unless --plain is specified), and, further, it will attempt to recover the exact same BGZF compression as in the original file. However, sometimes exact-same BGZF compression is not possible due to different libraries used.  
2. The one exception to Genozip's strict losslessness is when using the --optimize option which is lossy (see --help for details)  
  
The command line options are similar to gzip and samtools/bcftools, so if you are familiar with these, it works pretty much the same. To get started, try: **genozip** --help  
  
***Commands***:   
**genozip**   - compress one or more files   
**genounzip** - decompress one or more files   
**genols**    - show metadata of one or more files or the entire directory   
**genocat**   - view one or more files   
  
***Some examples:***  
  
***Creating a reference file:***  
**genozip** --make-reference *myfasta.fa*  
  
***Compressing a FASTQ, SAM/BAM or VCF file(s) with a reference:***  
**genozip** --reference *myfasta.ref.genozip* mysample1.fq mysample2.fq mysample3.fq  
**genozip** --reference *myfasta.ref.genozip* mysample.bam  
**genozip** --reference *myfasta.ref.genozip* mysamples.vcf.gz  
**genozip** --reference *myfasta.ref.genozip* *     ←compresses all files in the current directory  
  
Notes:  
1. Genozip can compress with or without a reference - using a reference achieves much better compression when compressing FASTQ or unaligned SAM/BAM, and modestly better compression in other cases  
2. SAM/BAM - compression of aligned or unaligned SAM/BAM files is possible. Sorting makes no difference  
3. Long reads - compression of long reads (Pac Bio / Nanopore) achieves signficantly better results when compressing an aligned BAM vs an unaligned BAM or FASTQ  
4. Compression of CRAM (but not SAM or BAM) files requires samtools to be installed  
5. Use --REFERENCE instead of --reference to store the relevant parts of the reference file as part of the compressed file itself, which will then allow decompression with genounzip without need of the reference file.  
  
***Compressing and uncompressing paired-end reads with --pair - better than compressing FASTQs individually***  
**genozip** --reference *myfasta.ref.genozip* --pair mysample-R1.fastq.gz mysample-R2.fastq.gz  
**genounzip** --reference *myfasta.ref.genozip* --unbind mysample-R1+2.fastq.genozip  
  
***Using* genozip *in a pipline:***  
**genocat** *mysample.sam.genozip* | samtools - .....  
my-sam-outputing-method | **genozip** - --input sam --output *mysample.sam.genozip*  
  
***Lookups, downsampling and other subsets:***  
**genocat** --regions chr1:10000-20000 *mysamples.vcf.genozip*   ←displays a specific region  
**genocat** --regions ^Y,MT *mysample.bam.genozip*   ←displays all alignments except Y and MT contigs  
**genocat** --regions chrM *GRCh38.fa.genozip*   ←displays the sequence of chrM  
**genocat** --samples SMPL1,SMPL2 *mysamples.vcf.genozip*   ←displays 2 samples  
**genocat** --grep 1101:2392 *myreads.fq.genozip*   ←displays reads that have "1101:2392" anywhere in the description  
**genocat** --downsample 10 *mysample.fq.genozip*   ←displays 1 in 10 reads  
Notes:  
1. --regions works with VCF, SAM/BAM, FASTA, 23andMe, GVF and reference files ; --grep works with FASTQ, FASTA ; --samples works with VCF ; --downsample works with all types  
2. There is no need for a separate indexing step or index file  
3. Many more options (see --help for full list): --no-header ; --header-only ; --header-one ; --sequential ; --list-chroms ; --drop-genotypes ; --GT-only  
  
***Binding mutiple files into a single genozip file and unbinding:***  
**genozip** **.fq.gz* -o *all-samples.fq.genozip*   ←binds all .fq.gz files in the current directory  
**genounzip** *my-project.fq.genozip* --unbind   
  
***Compressing even better, with some minor modifications of the data (therefore not lossless, see --help for details):***  
**genozip** *file.bam* --optimize   
  
***Compressing faster, sacrificing a bit of compression ratio:***  
**genozip** *file.bam* --fast   
  
***Encrypting (256 bit AES):***  
**genozip** *file.vcf* --password *abc*   
**genounzip** *file.vcf.genozip* --password *abc*   
  
***Converting SAM/BAM to FASTQ:***  
**genounzip** *file.bam.genozip* --fastq  
  
***Converting 23andMe to VCF:***  
**genounzip** *genome_mydata-Full.txt.genozip* --vcf -e GRCh37.ref.genozip  
  
***Generate a samtools/bcftools index file when uncompressing:***  
**genounzip** *file.bam.genozip* --index  
  
***Calculating the MD5 of the underlying textual file (also included in *--test*):***  
**genozip** *file.vcf* --md5   
**genounzip** *file.vcf.genozip* --md5   
**genols** *file.vcf.genozip*  
  
***Compressing and then verifying that the compressed file decompresses correctly:***  
**genozip** *file.vcf* --test   
  
***Citing***  
Do you find Genozip useful? Please support continued development by citing:  
Lan, D., et al. *Bioinformatics*, 36, 4091–4092, July 2020, https://doi.org/10.1093/bioinformatics/btaa290  
<br> 
Feature requests and bug reports: **bugs@genozip.com**   
  
**Genozip** is free for non-commercial use. For a commercial license, please contact **sales@genozip.com**   
  
Usage is subject to terms and conditions. The non-commercial license can be viewed with **genozip** --license  
  
THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  

Current build status
====================


<table>

  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8867&branchName=master">
            <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/genozip-feedstock?branchName=master">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8867&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/genozip-feedstock?branchName=master&jobName=linux&configuration=linux_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8867&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/genozip-feedstock?branchName=master&jobName=osx&configuration=osx_" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
  <tr>
    <td>Windows</td>
    <td>
      <img src="https://img.shields.io/badge/Windows-disabled-lightgrey.svg" alt="Windows disabled">
    </td>
  </tr>
  <tr>
    <td>Linux_ppc64le</td>
    <td>
      <img src="https://img.shields.io/badge/ppc64le-disabled-lightgrey.svg" alt="ppc64le disabled">
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-genozip-green.svg)](https://anaconda.org/conda-forge/genozip) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/genozip.svg)](https://anaconda.org/conda-forge/genozip) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/genozip.svg)](https://anaconda.org/conda-forge/genozip) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/genozip.svg)](https://anaconda.org/conda-forge/genozip) |

Installing genozip
==================

Installing `genozip` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
```

Once the `conda-forge` channel has been enabled, `genozip` can be installed with:

```
conda install genozip
```

It is possible to list all of the versions of `genozip` available on your platform with:

```
conda search genozip --channel conda-forge
```

Feedstock Maintainers
=====================

* [@divonlan](https://github.com/divonlan/ divon@genozip.com)
