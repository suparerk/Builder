LeftSidbar = React.createClass
  drawCanvas: (e) ->
    image = e.target.src
    c = document.getElementById('Dwrap')
    console.log c
    console.log image.src
    c.src = image
    # ctx = c.getContext('2d')
    # img = document.getElementById(image)
    # ctx.drawImage img,0,0,500,500
  render: ->
    React.DOM.div
      className: 'Sidebar'
      React.DOM.div
        className: 'Card'
        React.DOM.div
          className: 'Card-header'
          React.DOM.h4
            className: 'title'
            'IMAGES'
        React.DOM.div
          className: 'ImagePicker'
          React.DOM.div
            className: 'ImagePicker-image'
            React.DOM.img
              src: 'https://hd.unsplash.com/photo-1470897655254-05feb2d2ab97'
              id: 'image1'
              onClick: @drawCanvas
            React.DOM.img
              src: 'https://hd.unsplash.com/photo-1465281508053-aee07fc08957'
              id: 'image2'
              onClick: @drawCanvas

@Left = React.createFactory(LeftSidbar)
