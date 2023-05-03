


# pip3 install mkdocs==1.1.2
# pip3 install plantuml-markdown==3.3.0
# pip3 install mkdocs-material==5.1.0
# pip3 install pymdown-extensions==8.0
# pip3 install pygments==2.6.1
# pip3 install fontawesome_markdown==0.2.6
# pip3 install mkdocs-git-committers-plugin==0.1.9
# pip3 install mkdocs-git-revision-date-localized-plugin==0.7

mkdocs build --verbose --clean

mkdocs gh-deploy

cd ../orgname.github.io/
mkdocs gh-deploy --config-file mkdocs.yml --remote-branch master

