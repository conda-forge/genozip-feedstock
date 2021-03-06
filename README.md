Genozip
=======  
  
(available on **Conda**, **Docker Hub** and https://github.com/divonlan/genozip ; Documentation: http://genozip.com)  
  
**Genozip** is a compressor for genomic files - while it can compress any file (i.e. not only genomic files), it is optimized to compress FASTQ, SAM/BAM/CRAM, VCF/BCF, FASTA, GVF, PHYLIP, Chain, Kraken and 23andMe files.  
  
**Citing** Do you find Genozip useful? Please cite:  
Lan, D., et al. (2021) **Genozip: a universal extensible genomic data compressor**. *Bioinformatics*, https://doi.org/10.1093/bioinformatics/btab102  
Lan, D., et al. (2020) **genozip: a fast and efficient compression tool for VCF files** *Bioinformatics*, 36, 4091–4092, https://doi.org/10.1093/bioinformatics/btaa290  
</p>
<br> 
Typically, a **2X-5X improvement over the existing compression** is achieved when compressing already-compressed files like .fastq.gz .bam vcf.gz and much higher ratios in some other cases.<br> 
<br> 
**Yes**, Genozip can compress already-compressed files (.gz .bz2 .xz .bam .cram).<br> 
<br> 
The compression is **lossless** - the decompressed file is 100% identical to the original file (see documentation for exceptions).<br> 
**Sign up** to receive low-frequency updates related to Genozip: https://tinyurl.com/genozip  
  
The command line options are similar to gzip and samtools/bcftools, so if you are familiar with these, it works pretty much the same. To get started, see: http://genozip.com  
  
**Genozip** is free for non-commercial use (as defined in the license). For a commercial license, please contact **sales@genozip.com**   
  
Usage is subject to terms and conditions. The license can be viewed on http://genozip.com/license.html  
  
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
