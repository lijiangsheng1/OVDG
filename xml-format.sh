#! /bin/bash 
#
# Simple script to generate HTML output from a DocBook file using 
# xmlto, or to generate PDF/RTF output by generating a fo file, 
# and then using Apache's FOP to format that.
#
# wvh@vonhagen.org
#

function usage {
	echo "Usage: $0 [OPTIONS] document-name"
	echo "  -D : produce draft mode document" 
	echo "  -d : use specifed xsl driver (requires name of XSL file) "
	echo "  -h : generate HTML output (requires output directory name)"
	echo "  -k : attempt PDF generation even if xsltproc errors were encountered"
	echo "  -n : suppress TOC" 
	echo "  -r : produce RTF output rather than PDF" 
	exit 1
}

dir=`dirname $0`

XSLTPROC="xsltproc"

if [ $# == 0 ] ; then
	usage
	exit 
fi

driverfile="../docbook-xsl/fo/docbook.xsl"
draft="no"
keepgoing="no"
RTFoutput="no"
HTMLoutput="no"

while getopts ":d:h:Dknr" opt
do
  case $opt in
      d  ) 
           driverfile=$OPTARG
	   echo "Using driver file: $driverfile"
	   if [ ! -f $driverfile ] ; then
	       echo "  Driver file not found"
	       exit 1
	   fi
	   ;;
      D  )
           draft="yes"
	   echo "Producing Draft Mode Document"
	   ;;
      h  )
           HTMLdir=$OPTARG
           HTMLoutput="yes"
	   echo "Producing HTML output to $HTMLdir instead of PDF"
	   if [ -d $HTMLdir ] ; then
	       echo "  Output directory $HTMLdir already exists"
	       exit 1
	   fi
	   ;;
      k  )
	   keepgoing="yes"
	   echo "Will not stop if errors are encountered"
	   ;;
      n  ) 
           notoc="--stringparam generate.toc ''"
	   echo "Supressing TOC..."
	   ;;
      r  )
           RTFoutput="yes"
           echo "Producing RTF output rather than PDF"
	   ;;
      \? ) 
           usage
           exit 1;;
  esac
done
shift $(($OPTIND - 1))

if [ ! -f $1 ] ; then
	echo "  Input file $1 not found - exiting."
	exit 
fi

doc_base=`basename $1 .xml`

echo "Processing base name: $doc_base"

if [ x$HTMLoutput != "xno" ] ; then
     xmlto --skip-validation -o $HTMLdir html $1
     exit
fi

echo "  Generating FO file:  $doc_base.fo"

$XSLTPROC --stringparam draft.mode $draft \
          --stringparam toc.section.depth "2" \
          --stringparam chunk.section.depth "4" \
          --stringparam l10n.gentext.language "zh_cn" \
          --stringparam show.comments 1 \
          --stringparam generate.section.toc.level "3" \
          --stringparam fop1.extensions "1" \
          --xinclude -o  $doc_base".fo" \
          $notoc \
          $driverfile \
          $1 1> xsltproc.out 2> xsltproc.out

probs=`grep -i error xsltproc.out | wc -l | sed -e 's; ;;g'`

if [ x$probs != "x0" ] ; then
	echo ""
	echo "PROBLEMS:"
	echo ""
	cat xsltproc.out
	echo ""
	if [ x$keepgoing = "xno" ] ; then
		exit
	fi
fi

echo "    Fixing FO file references to system images..."
cat $doc_base".fo" | sed -e "s;\"url(\.\./external/;\"url($dir/\.\./external/;g" > $$
mv $$ $doc_base".fo"

if [ x$RTFoutput = "xno" ] ; then
    echo "  Generating PDF file: $doc_base"".pdf"
	fop -q -c ../fop/conf/fop.xconf -fo $doc_base".fo" -pdf $doc_base".pdf" 1> fop.out 2> fop.out
else
    echo "  Generating RTF file: $doc_base"".rtf"
	fop -fo $doc_base".fo" -rtf $doc_base".rtf" 1> fop.out 2> fop.out
fi

probs=`grep -i Exception fop.out | wc -l | sed -e 's; ;;g'`

if [ x$probs != "x0" ] ; then
	echo ""
	echo "EXCEPTION OCCURRED DURING PROCESSING:"
	echo ""
	cat fop.out
	echo ""
fi
