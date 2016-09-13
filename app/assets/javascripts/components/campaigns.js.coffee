@Campaigns = React.createClass
  getInitialState: ->
    header: ''
    desc: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  render: ->
    React.DOM.div
      className: 'campaigns Container'
      React.createElement Left
      React.DOM.div
        className: 'Main'
        React.DOM.h2
          className: 'Main-subtitle'
          'Create your campaign'
        React.DOM.div
          className: 'wrapper'
          position: 'relative'
          React.DOM.img
            src: 'https://hd.unsplash.com/photo-1470897655254-05feb2d2ab97'
            id: 'Dwrap'
            className: 'absolute-p'
            width: 500
            height: 500
          React.DOM.canvas
            id: 'myCanvas'
            className: 'ImageCanvas absolute-p'
            width: 500
            height: 500
        React.DOM.div
          className: 'row'
          React.DOM.span
            className: 'textvalue'
            id: 'HeaderValue'
            'This is your Header:'
        React.DOM.div
          className: 'row'
          React.DOM.span
            className: 'textvalue'
            id: 'DescValue'
            'This is your description:'
      React.createElement Right
