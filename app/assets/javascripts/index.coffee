# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  formatMomentDuration = (duration) ->
    return "#{('00' + duration.hours()).slice(-2)}:#{('00' + duration.minutes()).slice(-2)}:#{('00' + duration.seconds()).slice(-2)}"

  isWorking = true

  $(document).on 'click', '.start-button', ->
    $('.waiting-for-action-area').hide()
    $('.couting-area').show()

    $('title').text('Working 🏃')

    setInterval ->
      $('#attendance_record_end_time').val(moment().format())

      if isWorking
        next = moment.duration($('.work-time').text()).add(1, 'seconds')
        $('.work-time').text(formatMomentDuration(next))
      else
        # formatted text
        next = moment.duration($('.break-time').text().slice(2, 10)).add(1, 'seconds')
        $('.break-time').text(" (#{formatMomentDuration(next)})")

        # raw value
        $('#attendance_record_break_time').val(Number($('#attendance_record_break_time').val()) + 1)
    , 1000

  $(document).on 'click', '.stop-button', ->
    $('#attendance-record-form').submit()

  $(document).on 'click', '.pause-button', ->
    if isWorking
      $('.pause-button').text('Restart')
      $('title').text('Taking a break 😪')
      isWorking = false
    else
      $('.pause-button').text('Pause')
      $('title').text('Working 🏃')
      isWorking = true
