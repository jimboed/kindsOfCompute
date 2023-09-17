from markdown import Markdown
from fontawesome_markdown import FontAwesomeExtension

markdown = Markdown(extensions=[FontAwesomeExtension()])


for x in dir(markdown):
    print(x)




