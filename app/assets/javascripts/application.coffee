renderPhoto = (photo) ->

  image = new Image()
  image.src = photo.image_url

  $(image).on('load', ->

    gridElement = $('<div />').attr('class', 'photo')

    $('<img />').attr('src', photo.image_url).appendTo(gridElement)
    
    $(photo.faces).each(->

      $('<div class="face"><img src="/img/cage.png"></div>')
        .css('top', "#{@top}px")
        .css('left', "#{@left}px")
        .css('width', "#{@width}px")
        .appendTo(gridElement)

    )

    gridElement.prependTo('.grid')

    setTimeout(->

      gridElement.addClass('visible')

    , 100)

  )

image = new Image()
image.src = '/img/cage.png'

$(image).on('load', ->

  $.ajax(
    url: '/photos.json',
    success: (photos) -> $(photos).each(-> renderPhoto(this))
  )
)