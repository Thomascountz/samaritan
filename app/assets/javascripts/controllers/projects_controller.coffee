@updateStateOptions = (states) ->
  $stateSelect = $("#project_region")
  for state in states
    option = "<option value='#{state.symbol}'>#{state.name}</option>"
    $stateSelect.append(option)    

$ ->
  $("#project_country").on "change", () ->
    $countryCode = $(this).val()
    $regionSelect = $("#project_region")
    $regionSelect.empty()

    if $countryCode != "US"
      $regionSelect.append("<option value=''></option>")

    $.ajax
      type: "POST", # HTTP verb
      url: "/time_zones/states_for_country", # request path
      data: "country_code=#{$countryCode}", # data being sent to the server
      dataType: "json", # data type expected back from the server
                        # "json" will automatically parse the string in to a JS object
                        
      success: (data, _status, _jqxhr) -> # function to be called if request succeeds
        updateStateOptions(data)

