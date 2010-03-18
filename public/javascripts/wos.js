var latest_verified_time = "";
/* Check for newly verified sheep, add to table, and highlight.
 * 
 * Downloads all verified sheep that have been updated since the
 * last sheep that was added.
 */
check_for_new_sheep = function(){
  $.ajax({
    url: 'entries',
    dataType: 'json',
    data: {latest_verified_time: latest_verified_time},
    success: function(data) {
      //since we only get new rows we need to clear old notes
      $('td.note').html('');
      data.reverse(); // Since we are adding rows in reverse order
      $(data).each(function() {
        // Construct the new row.
        entry = this['entry'];
        var row = "<tr id='verified_"+entry.id+"'><td>"+entry.username+"</td><td>"+entry.password+"</td>";
        row += "<td>"+entry.domain+"</td><td>"+entry.protocol+"</td><td>"+entry.mac+"</td>";
        row += "<td class='note'>"+entry.note+"</td></tr>";

        // Add the new row to the table 
        //Paranoid of duplicates!!! 
        $('table#sheep #verified_'+entry.id).html('');         
        $('table#sheep tbody:last').prepend(row);
        $('#verified_'+entry.id+' td').effect("highlight", {}, 6000);

        latest_verified_time = entry.updated_at;
      });
    }
  });
};

$(document).ready(function() {
  // Check every 30 seconds
  $('table#sheep').everyTime(30000, label = "checker", function(i) {
    check_for_new_sheep();
  }, 0);
  check_for_new_sheep();
});
