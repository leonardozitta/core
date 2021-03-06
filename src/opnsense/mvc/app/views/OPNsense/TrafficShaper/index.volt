{#

OPNsense® is Copyright © 2014 – 2015 by Deciso B.V.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1.  Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2.  Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

#}
<style>
    .hidden {
        display:none;
    }
</style>
<script type="text/javascript">

    $( document ).ready(function() {


        var grid =$("#grid-basic").bootgrid({
            ajax: true,
            selection: true,
            multiSelect: true,
            url: '/api/trafficshaper/settings/searchPipes',
            formatters: {
                "commands": function(column, row)
                {
                    return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.uuid + "\"><span class=\"fa fa-pencil\"></span></button> " +
                            "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.uuid + "\"><span class=\"fa fa-trash-o\"></span></button>";
                }
            }
        });

        grid.on("loaded.rs.jquery.bootgrid", function(){
            /* Executes after data is loaded and rendered */
            grid.find(".command-edit").on("click", function(e)
            {
                alert("You pressed edit on row: " + $(this).data("row-id"));
            }).end().find(".command-delete").on("click", function(e)
            {
                alert("You pressed delete on row: " + $(this).data("row-id"));
            });
        });


        $("#test").click(function(){
            var rows =$("#grid-basic").bootgrid('getSelectedRows');
            alert(rows);
            $("#grid-basic").bootgrid("reload")
//            var rowIds = [];
//            for (var i = 0; i < rows.length; i++)
//            {
//                rowIds.push(rows[i]);
//            }
//            alert("Select: " + rowIds.join(","));

            //alert(JSON.stringify($("#grid-basic").bootgrid('getSelectedRows')));
        });

    });


</script>



<table id="grid-basic" class="table table-condensed table-hover table-striped">
    <thead>
    <tr>
        <th data-column-id="number" data-type="number">Number</th>
        <th data-column-id="bandwidth" data-type="number">Bandwidth</th>
        <th data-column-id="bandwidthMetric" data-type="string">BandwidthMetric</th>
        <th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>
        <th data-column-id="uuid" data-type="string" data-identifier="true"  data-visible="false">ID</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th><button id="test">test</button></th>
    </tfoot>
</table>
