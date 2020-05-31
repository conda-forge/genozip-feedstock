genozip
=======

\
 **genozip** is a compressor for genomic files - it compresses VCF/BCF,
SAM/BAM, fastq, fasta, GVF and 23andMe files. If can even compress them
if they are already compressed with .gz .bz2 .xz (for full list of
supported file types see 'genozip --input --help').\
 \
 It achieves x2 to x5 better compression ratios than gzip because it
leverages some properties specific to genomic data to compress better.
It is also a lot faster than gzip.\
 \
 The compression is lossless - the decompressed file is 100% identical
to the original file.\
 \
 The command line options are similar to gzip and bcftools, so if you're
familiar with these, it works pretty much the same. To get started, try:
**genozip** --help\
 \
 ***Commands***: \
 **genozip** - compress one or more files \
 **genounzip** - decompress one or more files \
 **genols** - show metadata of one or more files or the entire directory
\
 **genocat** - view one or more files \
 \
 ***Some advanced options:***\
 \
 ***Lookups:***\
 **genocat** -r \^Y,MT *file1.vcf* -- displays all chromosomes except Y
and MT\
 **genocat** -r -10000 *file1.vcf* -- displays positions up to 10000\
 **genocat** -s SMPL1,SMPL2 *file1.vcf* -- displays 2 samples\
 Note: there is no need for a separate indexing step or index file\
 \
 ***Concatenating & splitting:***\
 **genozip** *file1.vcf file2.vcf* -o *concat.vcf.genozip* \
 **genounzip** *concat.vcf.genozip* -O \
 \
 ***Calculating the MD5:***\
 **genozip** *file.vcf* --md5 \
 \
 ***Encryption:***\
 **genozip** *file.vcf* --password *abc* \
 \
 ***Even better compression, with some minor modifications of the
data:***\
 **genozip** *file.vcf* --optimize \
 \
 ***Compress and then verify that the compressed file decompresses
correctly:***\
 **genozip** *file.vcf* --test \
 \
 Do you find genozip to be helpful in your research? Please be so kind
as to support continued development by citing **Citing:**
https://doi.org/10.1093/bioinformatics/btaa290 \
 Feature requests and bug reports: **bugs@genozip.com** \
 \
 **genozip** is free for non-commercial use. For a commercial license,
please contact **sales@genozip.com** \
 \
 Usage is subject to terms and conditions. The non-commercial license
can be viewed with **genozip** --license\
 \
 THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND
NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR ANYONE
DISTRIBUTING THE SOFTWARE BE LIABLE FOR ANY DAMAGES OR OTHER LIABILITY,
WHETHER IN CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.\

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
