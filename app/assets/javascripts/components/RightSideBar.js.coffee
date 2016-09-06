@RightSidbar = React.createClass
  getInitialState: ->
    header: ''
    desc: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valueKeyup: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
    HValue = document.getElementById("HeaderValue");
    HValue.innerText = "This is your Header: "+ e.target.value;
  valueKeyup2: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
    DValue = document.getElementById("DescValue");
    DValue.innerText = "This is your description: "+ e.target.value;
  render: ->
    React.DOM.div
      className: 'Sidebar'
      React.DOM.div
        className: 'Card'
        React.DOM.div
          className: 'Card-header'
          React.DOM.h4
            className: 'title'
            'Header'
        React.DOM.form
          className: 'form-inline'
          onSubmit: @handleSubmit
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'text'
              className: 'form-control'
              placeholder: 'Header'
              name: 'header'
              value: @state.head
              onChange: @valueKeyup
            React.DOM.label
              className: 'Main-subtitle'
              "Header of your campaign"
      React.DOM.div
        className: 'Card'
        React.DOM.div
          className: 'Card-header'
          React.DOM.h4
            className: 'title'
            'Description'
          React.DOM.div
            className: 'form-group'
            React.DOM.textarea
              className: 'form-control'
              placeholder: 'Description'
              name: 'desc'
              value: @state.head
              onChange: @valueKeyup2
            React.DOM.label
              className: 'Main-subtitle'
              "Description of your campaign"
