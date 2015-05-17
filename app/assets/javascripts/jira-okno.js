var handleJiraOkno;
var scrollJiraOkno;

handleJiraOkno = function(){
    var dataTable = $("#data-table");
    var jiraOkno = $("#jira-okno");
    var closeJiraOkno = $("#close-jira-okno");
    var header = $("th", dataTable).not('.stats th');
    var dataDableTable = $("#data-table-table");
    var ico_index = null;
    var company_index = null;

    var selects = document.getElementsByName("type_id");

    for (i = 0; i < selects.length; i++) {
        if (selects[i].value == 7) {
            ico_index = i + 1;
        } else if (selects[i].value == 8) {
            company_index = i + 1;
        }
    }

    <!-- Generating TABLE with labels and empty values-->
    table = '<table class="table table-striped" id="jira-oknko-table">';
    header.each(function (index) {

        row = '<tr>';
        row += '<td class="text-left" style="width: 40%; word-break: break-all">'; //style has to be written in-line, else overridden by bootstrap
        row += '<strong>' + $(this).text() + ':</strong>';
        row += '</td>';
        row += '<td class="text-left" style="width: 60%; word-break: break-all"></td>'; //style has to be written in-line, else overridden by bootstrap
        row += '</tr>';
        table += row;
    });

    table += '</table>';
    $('.body', jiraOkno).append(table);

    //SET MAX HEIGHT
    jiraOkno.css({
        'max-height': dataDableTable.height()+'px',
        'overflow-y': 'auto'
    });

    $("#jira-okno-table").css({
        'max-width': jiraOkno.width()+'px',
        height: '100%'
    });

    // Adding Finstat and Foaf buttons to TABLE if dataset has ICO or Company name
    if (ico_index !== null || company_index !== null) {
        fin_foaf = '<table class="table table-transparent">';
        fin_foaf += '<tr><td></td><td></td></tr>';
        fin_foaf += '</table>';
        $('.fin_foaf', jiraOkno).append(fin_foaf);
    }

    // FUNCTION for closing JIRA Window
    closeJiraOkno.click(function () {
        dataTable.removeClass('col-md-9');
        dataTable.addClass('col-md-12');
        jiraOkno.css({display: 'none'});
    });

    // FUNCTION for opening JIRA Window
    $("tr.body", dataTable).click(function () {
        dataTable.removeClass('col-md-12');
        dataTable.addClass('col-md-9');
        jiraOkno.css({display: 'block'});
    });

    // Reading values from actual row
    $("tr.body", dataTable).click(function () {
        data = $("td", this);

        data.each(function (index) {
            // If ICO or if Company exist, fill button link
            if (ico_index !== null && ico_index == index) {
                $('.fin_foaf tr:nth-child(1) td:nth-child(1)', jiraOkno).html('<a href="http://www.finstat.sk/Hladaj?query=' + $(this).text() + '" class="btn btn-finstat" role="button" target="_blank"><span class="glyphicon glyphicon-stats"></span> Finstat.sk</a>');
                $('.fin_foaf tr:nth-child(1) td:nth-child(2)', jiraOkno).html('<a href="http://foaf.sk/?q=' + $(this).text() + '" class="btn btn-foaf" role="button" target="_blank"><span class="glyphicon glyphicon-stats"></span> Foaf.sk</a>');
            } else if (company_index !== null && company_index == index) {
                $('.fin_foaf tr:nth-child(1) td:nth-child(1)', jiraOkno).html('<a href="http://www.finstat.sk/Hladaj?query=' + $(this).text() + '" class="btn btn-finstat" role="button" target="_blank"><span class="glyphicon glyphicon-stats"></span> Finstat.sk</a>');
                $('.fin_foaf tr:nth-child(1) td:nth-child(2)', jiraOkno).html('<a href="http://foaf.sk/?q=' + $(this).text() + '" class="btn btn-foaf" role="button" target="_blank"><span class="glyphicon glyphicon-stats"></span> Foaf.sk</a>');
            }

            $('.body tr:nth-child(' + (index + 1) + ') td:nth-child(2)', jiraOkno).text($(this).text());
        });
    });
}

scrollJiraOkno = function(){
    //SET DOM
    var dataTable = $("#data-table");
    var dataTableTable = $("#data-table-table");
    var jiraOkno = $("#jira-okno");

    //SET POSITIONS
    var dataTableTop = dataTable.position().top;
    var dataTableBottom = dataTableTop + dataTableTable.height();

    //FIND OUT WHEATHER JIRA OKNO CAN SCROLL
    var canScroll = true;

    //SCROLL JIRA OKNO
    if(canScroll) {
        $(window).scroll(function (event) {
            var jiraOknoHeight = jiraOkno.height();
            var scrollPosition;
            var jiraOknoPosition;

            //SET BOUNDRIES
            var boundriesTop = dataTableTop;
            var boundriesBottom = dataTableBottom - jiraOknoHeight;

            scrollPosition = $(window).scrollTop();

            if (scrollPosition > boundriesTop && scrollPosition < boundriesBottom) {
                jiraOknoPosition = scrollPosition - dataTableTop;
                jiraOkno.css({top: jiraOknoPosition + 'px'});
            } else if (scrollPosition < boundriesTop) {
                jiraOkno.css({top: '0px'});
            }
        });
    }
}

//INVOKE JIRA OKNO ON DOCUMENT READY
$(document).ready(handleJiraOkno);
//$(document).on('page:load', handleJiraOkno)

$(document).ready(scrollJiraOkno);
//$(document).on('page:load', scrollJiraOkno)