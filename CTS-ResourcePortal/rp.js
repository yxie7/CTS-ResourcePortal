//Sidebar menu button
$(window).scroll(function () {
    $("#sidebarCollapse").css("top", Math.max(15, 250 - $(this).scrollTop()));
});

$(document).ready(function () {
    //Start sidebar js
    $('#dismiss, .overlay').on('click', function () {
        $('#sidebar').removeClass('active');
        $('.overlay').removeClass('active');
    });

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').addClass('active');
        $('.overlay').addClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
    //End sidebar js

    //Banner cookie generator, hides the welcome banner if this cookie exists
    if (document.getElementById("btnBanner")) {
        document.getElementById("btnBanner").onclick = function () {
            var days = 1;
            var exp = new Date();
            exp.setTime(exp.getTime() + (days * 24 * 60 * 60 * 1000));
            exp = exp.toUTCString();

            document.cookie = "ck=bannerDismissed; " + "expires=" + exp;
        }
    };

    //Banner checker
    var ck = document.cookie.replace(/(?:(?:^|.*;\s*)ck\s*\=\s*([^;]*).*$)|^.*$/, "$1");
    if (ck == "bannerDismissed") {
        $("#banner").alert('close');
    };
});

//Automatic initialization for DataTables with ID datatable and selections
$(function () {
    if (document.getElementById("datatable")) {
        var resourceList = $('[id*=datatable]').DataTable({
            "scrollX": true,
            "autoWidth": false,
            stateSave: true,
            "fnCreatedRow": function (nRow, aData, iDataIndex) {
                $(nRow).children("td").css("white-space", "nowrap");
            }
        });
        $(window).resize(function () {
            $(".sorting").width("");    //This is the class it sets to each < th >
            $(".table").width("100%");     //Class I set to the table for  this. An id won't work.
            $(".dataTables_scrollHeadInner").width("100%"); // Class of div added by DataTables, contains the header table.
        });
    }
    if (document.getElementById('#<%= Selections.ClientID %>')) {
        var selections =
            $('#<%= Selections.ClientID %>').DataTable({
                "bFilter": false,
                "bLengthChange": false,
                "autoWidth": false,
                "scrollX": true,
                stateSave: true,
                "fnCreatedRow": function (nRow, aData, iDataIndex) {
                    $(nRow).children("td").css("white-space", "nowrap");
                }
            });

        $(window).resize(function () {
            $(".sorting").width("");    //This is the class it sets to each < th >
            $(".table").width("100%");     //Class I set to the table for  this. An id won't work.
            $(".dataTables_scrollHeadInner").width("100%"); // Class of div added by DataTables, contains the header table.
        });
    }

    if (document.getElementById('#<%= gvAdmins.ClientID %>')) {
        var admins =
            $('#<%= gvAdmins.ClientID %>').DataTable({
                "scrollX": true,
                "autoWidth": false,
                stateSave: true,
                "fnCreatedRow": function (nRow, aData, iDataIndex) {
                    $(nRow).children("td").css("white-space", "nowrap");
                }
            });

        $(window).resize(function () {
            $(".sorting").width("");    //This is the class it sets to each < th >
            $(".table").width("100%");     //Class I set to the table for  this. An id won't work.
            $(".dataTables_scrollHeadInner").width("100%"); // Class of div added by DataTables, contains the header table.
        });
    }
    /* Does something?
    if (document.getElementById('datatable')) {
        $('[id*=datatable]').DataTable({
            "autoWidth": false,
            columnDefs: [{
                orderable: false,
                className: 'select-checkbox',
                targets: 0
            }],
            select: {
                style: 'os',
                selector: 'td:first-child'
            },
            order: [[1, 'asc']]
        });
    }*/

    //Check all?
    $("#datatable [id*=chkHeader]").click(function () {
        if ($(this).is(":checked")) {
            $("#datatable [id*=chkRow]").attr("checked", "checked");
        } else {
            $("#datatable [id*=chkRow]").removeAttr("checked");
        }
    });
    $("#datatable [id*=chkRow]").click(function () {
        if ($("#datatable [id*=chkRow]").length == $("#datatable [id*=chkRow]:checked").length) {
            $("#datatable [id*=chkHeader]").attr("checked", "checked");
        } else {
            $("#datatable [id*=chkHeader]").removeAttr("checked");
        }
    });
});

function reloadTables() {
    resourceList.ajax.draw();
    selections.ajax.draw();
};

//Modals below
function ShowPopup(title, body) {
    $("#MyPopup .modal-title").html(title);
    $("#MyPopup .modal-body").html(body);
    $("#MyPopup").modal("show");
};

function ShowPopup1(title, body) {
    $("#MyPopup1 .modal-title").html(title);
    $("#MyPopup1 .modal-body").html(body);
    $("#MyPopup1").modal("show");
};

function ShowPopup2(title, body) {
    $("#MyPopup2 .modal-title").html(title);
    $("#MyPopup2 .modal-body").html(body);
    $("#MyPopup2").modal("show");
};

function ShowPopup3(title, body) {
    $("#MyPopup3 .modal-title").html(title);
    $("#MyPopup3 .modal-body").html(body);
    $("#MyPopup3").modal("show");
};

function toasted(body) {
    $("#TheModal .modal-body").html(body);
    $("#TheModal").modal("show");
};

function infom() {
    $("#info").modal("show");
}

function sendModal() {
    $("#sendPrompt").modal("show");
};

function sendNotif() {
    $("#sent").modal("show");
};

function newAdmin() {
    $("#newAdmin").modal("show");
};