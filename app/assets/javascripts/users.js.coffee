# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#users').dataTable
    oLanguage:
      sUrl: "/ru_RU.txt"
    fnDrawCallback: (oSettings) ->
      return if oSettings.aiDisplay.length == 0
      nTrs = $('#users tbody tr')
      iColspan = nTrs[0].getElementsByTagName('td').length
      sLastGroup = ""
      lentrs=nTrs.length - 1
      for i in [1..lentrs]
        iDisplayIndex = oSettings._iDisplayStart + i
        sGroup = oSettings.aoData[ oSettings.aiDisplay[iDisplayIndex] ]._aData[0]
        if sGroup != sLastGroup
          nGroup = document.createElement( 'tr' )
          nCell = document.createElement( 'td' )
          nCell.colSpan = iColspan
          nCell.className = "group"
          nCell.innerHTML = sGroup
          nGroup.appendChild( nCell )
          nTrs[i].parentNode.insertBefore( nGroup, nTrs[i] )
          sLastGroup = sGroup
          return
        else
          return
    aoColumnDefs: [ { "bVisible": false, "aTargets": [ 0 ] } ]
    aaSortingFixed: [[ 0, 'asc' ]]
    aaSorting: [[ 1, 'asc' ]]
    sDom: 'lfr<"giveHeight"t>ip'
    bPaginate: false
    bInfo: false
