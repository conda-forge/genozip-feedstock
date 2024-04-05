
[![Current Release](https://img.shields.io/github/v/release/divonlan/genozip "Current Release")](https://github.com/divonlan/genozip/releases/latest) [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/genozip?label=Conda%20Downloads&style=flat-square)](https://anaconda.org/conda-forge/genozip)

Genozip
=======<br>
<br>
**Genozip** is a lossless compressor for  FASTQ, BAM/CRAM, VCF and <a href="https://www.genozip.com/compression">many other genomic files</a> - see https://genozip.com<br>
<br>
Genozip is also available on **Conda** and binary downloads, see <a href="https://genozip.com/installing">installation options</a>.<br>
<br>
Building from source: make -j (required for building: gcc 8.5 or above ; nasm).<br>
<br>
<h2>New: <a href="https://genozip.com">Genozip 15</a> - with Deep™ - losslessly co-compressing BAM and FASTQ files:</h2>

![v15 deep benchmark](https://github.com/divonlan/genozip/assets/56345591/39c7e9c5-135d-49c9-9213-89d4b830842a)

**Genozip** Genozip is a commercial product, but we make it free for certain academic research use. See <a href="https://genozip.com/get-genozip">eligibility and other licensing options</a> or contact <a href="mailto://sales@genozip.com">sales@genozip.com</a> <br>
<br>
**IMPORTANT**: Genozip is a commercial product, **NOT AN OPEN SOURCE** product - we provide our source code to assure users that they will always have access to the code needed to decompress their files. **HOWEVER**, reverse engineering, code modifications, derivative works or inclusion of the code or parts thereof into other software packages is strictly forbidden by the <a href="https://genozip.com/license">license</a>.<br>
<br>
Attributions for 3rd party source components: <a href="https://genozip.com/attributions">attributions</a>.<br>
<br>
**THIS SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS, COPYRIGHT HOLDERS OR DISTRIBUTORS OF THIS SOFTWARE BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.**<br>

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
