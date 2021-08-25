FROM rossmurr4y/mdbook-bin as mdbook-bin
FROM rossmurr4y/mdbook-pdf-bin as mdbook-pdf-bin
FROM rossmurr4y/mdbook-linkcheck-bin as mdbook-linkcheck-bin
FROM rossmurr4y/mdbook-mermaid-bin as mdbook-mermaid-bin
FROM rossmurr4y/mdbook-toc-bin as mdbook-toc-bin
FROM rossmurr4y/mdbook-plantuml-bin as mdbook-plantuml-bin
FROM rossmurr4y/mdbook-open-on-gh-bin as mdbook-open-on-gh-bin
FROM rossmurr4y/mdbook-graphviz-bin as mdbook-graphviz-bin
FROM rossmurr4y/mdbook-katex-bin as mdbook-katex-bin

FROM debian:bullseye-slim as mdbook-pdf

COPY --from=mdbook-bin /usr/local/cargo/bin/mdbook* /usr/bin/
COPY --from=mdbook-pdf-bin /usr/local/cargo/bin/mdbook* /usr/bin/
COPY --from=mdbook-linkcheck-bin /usr/local/cargo/bin/mdbook* /usr/bin/
COPY --from=mdbook-mermaid-bin /usr/local/cargo/bin/mdbook* /usr/bin/
COPY --from=mdbook-toc-bin /usr/local/cargo/bin/mdbook* /usr/bin/
COPY --from=mdbook-plantuml-bin /usr/local/cargo/bin/mdbook* /usr/bin/
COPY --from=mdbook-open-on-gh-bin /usr/local/cargo/bin/mdbook* /usr/bin/
COPY --from=mdbook-graphviz-bin /usr/local/cargo/bin/mdbook* /usr/bin/
COPY --from=mdbook-katex-bin /usr/local/cargo/bin/mdbook* /usr/bin/

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