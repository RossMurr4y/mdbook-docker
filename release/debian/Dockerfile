FROM rossmurr4y/mdbook-bin:latest as mdbook-bin
FROM rossmurr4y/mdbook-linkcheck-bin:latest as mdbook-linkcheck-bin
FROM rossmurr4y/mdbook-mermaid-bin:latest as mdbook-mermaid-bin
FROM rossmurr4y/mdbook-toc-bin:latest as mdbook-toc-bin
FROM rossmurr4y/mdbook-plantuml-bin:latest as mdbook-plantuml-bin
FROM rossmurr4y/mdbook-open-on-gh-bin:latest as mdbook-open-on-gh-bin
FROM rossmurr4y/mdbook-katex-bin:latest as mdbook-katex-bin
FROM rossmurr4y/mdbook-docx-bin:latest as mdbook-docx
#FROM rossmurr4y/mdbook-pdf-bin as mdbook-pdf-bin
#FROM rossmurr4y/mdbook-graphviz-bin as mdbook-graphviz-bin

# build a slim image for general usage without any extensions that require dependancies
FROM debian:bullseye-slim as mdbook-slim
COPY --from=mdbook-bin /usr/local/cargo/bin/mdbook* /usr/bin/
COPY --from=mdbook-linkcheck-bin /usr/local/cargo/bin/bin/mdbook* /usr/bin/
COPY --from=mdbook-toc-bin /usr/local/cargo/bin/bin/mdbook* /usr/bin/
COPY --from=mdbook-open-on-gh-bin /usr/local/cargo/bin/bin/mdbook* /usr/bin/
SHELL ["/bin/bash"]
WORKDIR /book
ENTRYPOINT [ "/usr/bin/mdbook" ]

FROM mdbook-slim as mdbook-pdf

COPY --from=mdbook-mermaid-bin /usr/local/cargo/bin/mdbook* /usr/bin/
COPY --from=mdbook-plantuml-bin /usr/local/cargo/bin/bin/mdbook* /usr/bin/
COPY --from=mdbook-katex-bin /usr/local/cargo/bin/bin/mdbook* /usr/bin/
COPY --from=mdbook-docx /usr/bin/mdbook-docx /usr/bin/

# currently wont build
#COPY --from=mdbook-pdf-bin /usr/local/cargo/bin/mdbook* /usr/bin/
#COPY --from=mdbook-graphviz-bin /usr/local/cargo/bin/mdbook* /usr/bin/
RUN apt-get update --allow-insecure-repositories; \
    apt-get install --no-install-recommends -y \
        ca-certificates \
        pandoc \
        texlive \
        texlive-xetex \
        graphviz \
        plantuml; \
    rm -rf /var/cache/apt/lists;

SHELL ["/bin/bash"]
WORKDIR /book
ENTRYPOINT [ "/usr/bin/mdbook" ]