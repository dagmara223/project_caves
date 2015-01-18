var TABLE = {
  numberRows : function() {
      for (i = 1; i < $('.row_number').length+1; i++) {
      //  $('.row_number').text(i)
      // console.log(i);
      return i;
      }
    }
};
$(document).ready(function() {
	$('.table').dataTable({
	  // ajax: ...,
	  // autoWidth: false,
	   pagingType: 'full_numbers',
	   processing: true,
	  // serverSide: true,

	  // Optional, if you want full pagination controls.
	  // Check dataTables documentation to learn more about available options.
	  // http://datatables.net/reference/option/pagingType
	});
  
	$(document).on('click', '.table, .paginate_button, .sorting, .sorting_desc, .sorting_asc', function() {
  		console.log("table sorting changed");
  		MAP.removeLayers();
  		MAP.addMarkers();
  });
  $(document).on('change', '.form-control', function() {
  		console.log("option value changed");
  		MAP.removeLayers();
  		MAP.addMarkers();
  });
  $(document).on('keydown', '.form-control', function() {
      console.log("option value changed");
      MAP.removeLayers();
      MAP.addMarkers();
  });  

});