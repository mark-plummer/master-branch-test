# Note that .sh scripts work only on Mac. If you're on Windows, install Git Bash and use that as your client.


    echo 'Deleting all old pdfs'
    rm pdf/*.pdf;
    echo "done";

    jsonfile=$(<book-list.json)
    theVersion=$(echo "$jsonfile" | jq -r .version)
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


    for book in $(echo "$jsonfile" | jq -r '.books[] | @base64'); do

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


        git checkout -- ${DIR}/pdfconfigs/config_mydoc_pdf.yml
        git checkout -- ${DIR}/_data/sidebars/mydoc_sidebar.yml
    done

    # echo "Done. Look in the pdf directory to see if it printed successfully."
    #
    # open pdf/$1_$2.pdf;
