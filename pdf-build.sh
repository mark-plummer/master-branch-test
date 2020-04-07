# Note that .sh scripts work only on Mac. If you're on Windows, install Git Bash and use that as your client.
# Make sure you have Prince and jq installed, otherwise the script will throw errors.

## Make sure script is in the git repo
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


## Make sure the gemfile is up-to-date
bundle install --quiet
if (( $? > 0 ));
    then
      printf "You are missing a bundle. Run bundle install to pick up the bundle";
      exit 1
fi

# Set some variables like the
bookList=$(<book-list.json)
theVersion=$(git branch | grep \* | cut -d ' ' -f2)
case $theVersion in
  [0-9].[0-9])
    printf "Creating PDFs for the $theVersion version\\n"
  ;;
  *)
    printf "Error. The version $theVersion format is not supported. Must be a major version number such as: w.x\\n" >&2
    helpmsg >&2
    exit 1
esac



if [ -d pdf ]; then
    echo 'Deleting all old pdfs'
    rm pdf/*.pdf;
    echo "done";
fi


for book in $(echo "$bookList" | jq -r '.books[] | @base64'); do

    sed -i "" "s/THEVERSION/${theVersion}/g" ${DIR}/book-list.json
    sed -i "" "s/THEVERSION/${theVersion}/g" ${DIR}/pdfconfigs/config_mydoc_pdf.yml

    # Get the book structure

    _jq() {
          echo ${book} | base64 --decode | jq -r ${1}
    }

    theName=$(echo $(_jq '.filename'))
    theTitle=$(echo $(_jq '.title'))

    sed -i "" "s/THETITLE/${theTitle}/g" ${DIR}/pdfconfigs/config_mydoc_pdf.yml

    for code in $(echo $(_jq '.codes') | jq -r '.[]'); do
      theCode=${code}
      sed -i "" "s/${code}/pdf/g" ${DIR}/_data/sidebars/mydoc_sidebar.yml
    done

    echo 'Killing all Jekyll instances'
    kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
    clear

    echo "Building PDF-friendly HTML site for Mydoc ...";
    bundle exec jekyll serve --detach --config _config.yml,pdfconfigs/config_mydoc_pdf.yml;
    echo "done";

    echo "Building the PDF ...";
    prince --javascript --pdf-keywords=prince-no-fallback --input-list=_site/pdfconfigs/prince-list.txt -o pdf/${theName}_${theVersion}.pdf;


    ## Reset everything for the next book
    git checkout -- ${DIR}/book-list.json
    git checkout -- ${DIR}/pdfconfigs/config_mydoc_pdf.yml
    git checkout -- ${DIR}/_data/sidebars/mydoc_sidebar.yml
done


sed -i "" "s/THEVERSION/${theVersion}/g" ${DIR}/index.html

# echo "Done. Look in the pdf directory to see if it printed successfully."
#
# open pdf/$1_$2.pdf;
