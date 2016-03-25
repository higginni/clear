# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $.get '/scores/index.json', (data) ->  
    Morris.Line
      element: $('#myfirstchart')
      data: data
      xkey: 'created_at'
      ykeys: ['strokes']
      labels: ['Score']


jQuery ->
  $.get '/scores/index.json', (data) ->  
    Morris.Bar
      element: $('#mysecondchart')
      data: data
      xkey: 'created_at'
      ykeys: ['strokes']
      labels: ['Score']
      