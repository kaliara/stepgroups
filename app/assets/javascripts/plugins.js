(function( $ ){ $.fn.kaliAnnounce = function (args) { return this.each(function() {
  // we need the announcements for this to work
  if (typeof args.json_data === 'undefined') {
    return;
  }
  // setting some defaults (can be overwritten when calling mkAnnounce)
  var $this = $(this), global = {
    options: $.extend({
      max_entries: args.json_data.length,
      cycle_period: 5000,
      element_tag: 'li'
    }, args),
    child: 0
  },

  // cycle through entries
  cycleEntries = function (){
    $this.children().eq(global.child - 1).fadeOut('slow');
    global.child = global.child === $this.children().length - 1 ? 0 : 1 + global.child;
    $this.children().eq(global.child - 1).delay(500).fadeIn('slow');
    setTimeout(cycleEntries, global.options.cycle_period);
  },
    
  // creates the html elements, hides them and appends them to $this, then cycles
  init = function (){
    var i, tag, link, announcement;
    for (i = 0; i < global.options.max_entries; i += 1) {
      announcement = global.options.json_data[i];

      link = document.createElement('a');
      link.href = '/announcements/' + announcement.id;
      link.title = announcement.body.replace(/(<([^>]+)>)/ig,"");
      link.innerHTML = announcement.header;

      tag = document.createElement(global.options.element_tag);
      tag.style.display = 'none';
      tag.appendChild(link);
      $this.append(tag);
    }
    
    if ($this.children().length > 1){
      cycleEntries();
    }
    else{
      $this.children().eq(0).fadeIn('slow');
    }
  };
  
  // build and cycle announcements
  init();
  
});};})( jQuery );