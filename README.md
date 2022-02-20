# MDBOOK Image Builder

This repository contains the definitions for a number of docker images used for working with `mdbook`.

If you are seeking an image to **use `mdbook` (and any of the plugins below)**, you want `rossmurr4y/mdbook` image.

If you are seeking a **specific binary/architecture combination**, you will want `rossmurr4y/<crate>-bin` i.e `rossmurr4y/mdbook-linkcheck-bin` at the path `/usr/local/cargo/bin/<crate>`.

If all you are seeking is a good **base image** for building mdbook-specific crates in, you will want `rossmurr4y/mdbook-builder-base`

Currently all images are debian-based.

All images support `linux/arm64/v8` and `linux/amd64` architectures.

## Usage

The `mdbook` image is setup to be used either in-place of mdbook with all the plugins and depenencies, or as a compose file.

### docker

```terminal
❯ docker run -it --volume $(pwd)/docs:/book rossmurr4y/mdbook:latest --help
mdbook v0.4.7
Mathieu David <mathieudavid@mathieudavid.org>
Creates a book from markdown files

USAGE:
    mdbook [SUBCOMMAND]

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

SUBCOMMANDS:
    build    Builds a book from its markdown files
    clean    Deletes a built book
    help     Prints this message or the help of the given subcommand(s)
    init     Creates the boilerplate structure and files for a new book
    serve    Serves a book at http://localhost:3000, and rebuilds it on changes
    test     Tests that a book's Rust code samples compile
    watch    Watches a book's files and rebuilds it on changes

For more information about a specific command, try `mdbook <command> --help`
The source code for mdBook is available at: https://github.com/rust-lang/mdBook
```

### compose

```yml
version: "3"
services:
  mdbook:
    container_name: mdbook
    image: rossmurr4y/mdbook
    stdin_open: true
    tty: true
    ports:
      - 3000:3000
    volumes:
      - ${PWD}:/book
    command:
      - serve
      - --hostname
      - "0.0.0.0"
```

## mdbook backends (plugins)

mdbook supports a number of pre- and post- processors.

The following are installed in the `rossmurr4y/mdbook` image (just update your `Book.toml` to use them), or individually through their build container image.

|                   | Image                 | Versions | Latest | Usage Docs                                           | Src                                                         |
| ----------------- | --------------------- | -------- | ------ | ---------------------------------------------------- | ----------------------------------------------------------- |
| mdbook            | mdbook-bin            | 0.4.7    | 0.4.7  | [Link](http://rust-lang.github.io/mdBook/index.html) | [Link](https://github.com/rust-lang/mdBook)                 |
| mdbook-linkcheck  | mdbook-linkcheck-bin  | 0.7.4    | 0.7.4  | [Link](https://crates.io/crates/mdbook-linkcheck)    | [Link](https://github.com/Michael-F-Bryan/mdbook-linkcheck) |
| mdbook-mermaid    | mdbook-mermaid-bin    | 0.8.0    | 0.8.0  | [Link](https://crates.io/crates/mdbook-mermaid)      | [Link](https://github.com/badboy/mdbook-mermaid)            |
| mdbook-toc        | mdbook-toc-bin        | 0.6.1    | 0.6.1  | [Link](https://crates.io/crates/mdbook-toc)          | [Link](https://github.com/badboy/mdbook-toc)                |
| mdbook-plantuml   | mdbook-plantuml-bin   | 0.7.0    | 0.7.0  | [Link](https://crates.io/crates/mdbook-plantuml)     | [Link](https://github.com/sytsereitsma/mdbook-plantuml)     |
| mdbook-open-on-gh | mdbook-open-on-gh-bin | 2.0.0    | 2.0.0  | [Link](https://crates.io/crates/mdbook-open-on-gh)   | [Link](https://github.com/badboy/mdbook-open-on-gh)         |
| mdbook-graphviz   | mdbook-graphviz-bin   | 0.0.2    | 0.0.2  | [Link](https://crates.io/crates/mdbook-graphviz)     | [Link](https://github.com/dylanowen/mdbook-graphviz)        |
| mdbook-katex      | mdbook-katex-bin      | 0.2.8    | 0.2.8  | [Link](https://crates.io/crates/mdbook-katex)        |                                                             |
| mdbook-pdf        | mdbook-pdf-bin        | 0.1.0    | 0.1.0  | [Link](https://github.com/rossmurr4y/mdbook-pdf)     | [Link](https://github.com/rossmurr4y/mdbook-pdf)            |
| mdbook-docx       | mdbook-docx           | 0.1.0    | 0.1.0  | [Link](https://github.com/rossmurr4y/mdbook-docx)    | [Link](https://github.com/rossmurr4y/mdbook-pdf)            |

## dependencies

Dependencies for each binary are setup within `rossmurr4y/mdbook` image.

Dependencies are not installed within the `<crate>-bin` images.

## image development

Building and pushing new images for is performed with `./build.sh`.
