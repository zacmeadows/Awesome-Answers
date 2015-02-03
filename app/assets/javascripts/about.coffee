# $ ->
  # $("button").click -> This also works but give less flexibility
  
  # EXCERCISE 1
  # -----------
  # $("button").on "click", ->
  #   $(@).toggleClass "btn-danger"


  # EXCERCISE 2
  # -----------
  # $("button").on "click", ->
  #   $(@).animate({
  #     height: "+=10",
  #     width: "+=50",
  #     fontSize: "+=5"
  #   })


  # EXCERCISE 3
  # -----------
  # (->
  #   capitalize = (string) ->
  #     string.charAt(0).toUpperCase() + string.slice(1)

  #   $ ->
  #     $("#sentence").on "keyup", ->
  #       word_array = $(@).val().split(" ")
  #       word_array = word_array.map((word) ->
  #         capitalize word
  #       )
  #       $("#shuffled").text word_array.join(" ")

  # ).call this

  
  # TAM"S SOLUTION --> REQUIRES FURTHER WORK
  # capitalize = (word) -> 
  #   word.charAt(0).toUpperCase() + word.slice(i)

  # $(".cap-each-word").keyup ->
  #   wordArray = $(@).val().split(" ")
  #   result = wordArray.map (word) -> capitalize(word)
  #   $(".cap-each-word-outcome").html result.join(" ")


  # EXCERCISE 4
  # -----------
  # (->
  #   changeColor = undefined
  #   colors = undefined
  #   currentIndex = undefined
  #   colors = []
  #   currentIndex = 0
  #   changeColor = ->
  #     $("body").css "background-color", colors[currentIndex]
  #     currentIndex = (if currentIndex >= (colors.length - 1) then 0 else currentIndex + 1)

  #   $ ->
  #     $("#color").on "keyup", (event) ->
  #       if event.keyCode is 13
  #         colors.push $(this).val()
  #         $("#colors").text colors.join(" ")
  #         $(this).val ""

  #     setInterval changeColor, 500

  #   return
  # ).call this


  # EXCERCISE 5
  # -----------
  # (->
  #   $ ->
  #     $("#email").on "blur", ->
  #       re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  #       if re.test($(this).val())
  #         $(".email-valid").removeClass "hide"
  #         $(".email-invalid").addClass "hide"
  #       else
  #         $(".email-valid").addClass "hide"
  #         $(".email-invalid").removeClass "hide"

  #     $("#password").on "blur", ->
  #       if $(this).val().length > 7
  #         $(".password-valid").removeClass "hide"
  #         $(".password-invalid").addClass "hide"
  #       else
  #         $(".password-valid").addClass "hide"
  #         $(".password-invalid").removeClass "hide"


  #   return
  # ).call this
  








