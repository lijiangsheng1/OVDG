
all: html pdf

html: 
	./xml-format.sh -h html xml/ovdg.xml
pdf:  
	./xml-format.sh -d ovdg.xsl -k xml/ovdg.xml
pdf-clean:
	rm *.out *.fo *.pdf 

html-clean:
	rm -rf html

all-clean:
	rm -rf *.out *.fo *.pdf html
