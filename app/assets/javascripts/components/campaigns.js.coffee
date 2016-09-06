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
      React.createElement LeftSidbar
      React.DOM.div
        className: 'Main'
        React.DOM.h2
          className: 'Main-subtitle'
          'Create your campaign'
        React.DOM.div
          className: 'row'
          React.DOM.span
            id: 'HeaderValue'
            'This is your Header:'
        React.DOM.div
          className: 'row'
          React.DOM.span
            id: 'DescValue'
            'This is your description:'
      React.createElement RightSidbar
