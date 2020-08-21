About genozip
=============

Home: https://github.com/divonlan/genozip

Package license: CUSTOM

Feedstock license: BSD-3-Clause

Summary: Compressor for genomic files (VCF/BCF, SAM/BAM, fastq, fasta, GVF, 23andMe), up to 5x better than gzip and faster too

genozip

(also available on Conda and Docker Hub)

genozip is a compressor for genomic files - it compresses FASTQ, SAM/BAM/CRAM, VCF/BCF, FASTA, GVF and 23andMe files. If can even compress them if they are already compressed with .gz .bz2 .xz (for full list of supported file types see 'genozip --input --help').

It achieves x2 to x5 better compression ratios than gzip because it leverages some properties specific to genomic data to compress better. It is also a lot faster than gzip.

The compression is lossless - the decompressed file is 100% identical to the original file.
Notes:
1. Losslessness is relative to the underlying textual file - for example, when compressing a .bam or a .fq.gz file - the losslessness is relative to the underlying SAM or FASTQ file respectively
2. The one exception is when using the --optimize option which is lossy (see --help for details)

The command line options are similar to gzip and samtools/bcftools, so if you are familiar with these, it works pretty much the same. To get started, try: genozip --help

Commands:
genozip   - compress one or more files
genounzip - decompress one or more files
genols    - show metadata of one or more files or the entire directory
genocat   - view one or more files

Some examples:

Creating a reference file:
genozip --make-reference myfasta.fa

Compressing a FASTQ, SAM/BAM or VCF file(s) with a reference:
genozip --reference myfasta.ref.genozip mysample1.fq mysample2.fq mysample3.fq
genozip --reference myfasta.ref.genozip mysample.bam
genozip --reference myfasta.ref.genozip mysamples.vcf.gz
genozip --reference myfasta.ref.genozip *    <--- compresses all files in the current directory

Notes:
1. genozip can compress with or without a reference - using a reference often achieves much better compression
2. SAM/BAM - compression of aligned or unaligned SAM/BAM files is possible. Sorting makes no difference
3. Long reads - compression of long reads (Pac Bio / Nanopore) achieves signficantly better results when compressing an aligned BAM vs an unaligned BAM or FASTQ
4. Compression of BAM and CRAM (but not SAM) files requires samtools to be installed
5. Use --REFERENCE instead of --reference to store the relevant parts of the reference file as part of the compressed file itself, which will then allow decompression with genounzip without need of the reference file.

Compressing and uncompressing paired-end reads with --pair - better than compressing FASTQs individually
genozip --reference myfasta.ref.genozip --pair mysample-R1.fastq.gz mysample-R2.fastq.gz
genounzip --reference myfasta.ref.genozip --unbind mysample-R1+2.fastq.genozip

Using genozip in a pipline:
genocat mysample.sam.genozip | samtools - .....
my-sam-outputing-method | genozip - --input sam --output mysample.sam.genozip

Lookups:
genocat --regions ^Y,MT mysamples.vcf.genozip  <-- displays all chromosomes except Y and MT
genocat --regions -10000 mysample.sam.genozip  <-- displays positions up to 10000
genocat --samples SMPL1,SMPL2 mysamples.vcf.genozip  <-- displays 2 samples
genocat --grep August-10 myfasta.fa.genozip  <-- displays contigs/reads that have "August-10" in the header
Notes:
1. --regions works with VCF, SAM/BAM, FASTA ; --grep works with FASTQ, FASTA ; --samples works with VCF
2. There is no need for a separate indexing step or index file
3. Many more options (see --help for full list): --no-header ; --header-only ; --sequential ; --list-chroms ; --drop-genotypes ; --GT-only

Binding mutiple files into a single genozip file & unbinding:
genozip *.fq.gz -o all-samples.fq.genozip <-- binds all .fq.gz files in the current directory
genounzip my-project.fq.genozip --unbind

Compressing even better, with some minor modifications of the data (therefore not lossless, see --help for details):
genozip file.bam --optimize

Compressing faster, sacrificing a bit of compression ratio:
genozip file.bam --fast

Encrypting (256 bit AES):
genozip file.vcf --password abc
genounzip file.vcf.genozip --password abc

Calculating the MD5 of the underlying textual file (also included in --test):
genozip file.vcf --md5
genounzip file.vcf.genozip --md5

Compressing and then verifying that the compressed file decompresses correctly:
genozip file.vcf --test

Citing
Do you find genozip useful? Please support continued development by citing:
Lan, D., et al. (2020) Bioinformatics, 36, 4091–4092, https://doi.org/10.1093/bioinformatics/btaa290

Feature requests and bug reports: bugs@genozip.com

genozip is free for non-commercial use. For a commercial license, please contact sales@genozip.com

Usage is subject to terms and conditions. The non-commercial license can be viewed with genozip --license

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
              <td>linux_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8867&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/genozip-feedstock?branchName=master&jobName=linux&configuration=linux_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=8867&branchName=master">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/genozip-feedstock?branchName=master&jobName=osx&configuration=osx_64_" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
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


About conda-forge
=================

[![Powered by NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](http://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/)
and [TravisCI](https://travis-ci.com/) it is possible to build and upload installable
packages to the [conda-forge](https://anaconda.org/conda-forge)
[Anaconda-Cloud](https://anaconda.org/) channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating genozip-feedstock
==========================

If you would like to improve the genozip recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/genozip-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://conda.io/docs/user-guide/tasks/build-packages/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://conda.io/docs/user-guide/tasks/build-packages/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@divonlan](https://github.com/divonlan/)

