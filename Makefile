DOCS=index lectures announcements papers calendar reviews notes scribe project

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix , $(HDOCS))

.PHONY : docs
docs : $(PHDOCS)

%.html : %.jemdoc MENU
	    ./jemdoc -o $@ $<

.PHONY : clean
clean :
	rm -f *.html
	rm -f *~

.PHONY : update
update : 
	rm -f *~
	rsync -avze ssh --delete --exclude '*.jemdoc' --exclude 'MENU' --exclude 'Makefile' ./ fadel@athena.dialup.mit.edu:~/www/courses/MAS.S66/

