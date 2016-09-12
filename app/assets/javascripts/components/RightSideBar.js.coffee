@colors = [
  'white',
  'black',
  '#444',
  '#007fff',
  '#ffb300',
  '#71c318'
]
@fontSizes = [
  8,
  10,
  12,
  14,
  16,
  18,
  20,
  22,
  26,
  32,
  36,
  42,
  48,
  54
]
@fonts = ['Arial', 'Georgia', 'Helvetica']

# @DropDown = React.createClass(
#   render: ->
#     setOption: ->
#       fonts = ['Arial', 'Georgia', 'Helvetica']
#         MakeFont: (f) ->
#           <option>{f}</option>
#       <select>{fonts.map(MakeFont)}</select>)


@RightSidbar = React.createClass
  getInitialState: ->
    header: ''
    desc: ''
    font: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valueKeyup: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
    HValue = document.getElementById("HeaderValue");
    HValue.innerText = "This is your Header: "+ e.target.value;
    @insertTextToCanvas(e.target.value)
  valueKeyup2: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
    DValue = document.getElementById("DescValue");
    DValue.innerText = "This is your description: "+ e.target.value;
    @insertTextToCanvas2(e.target.value)
  insertTextToCanvas: (text) ->
    canvas = document.getElementById('myCanvas')
    ctx = canvas.getContext('2d')
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.font="42px Arial";
    textString = text
    textWidth = ctx.measureText(textString).width
    ctx.fillText textString, canvas.width / 2 - (textWidth / 2), 100
  insertTextToCanvas2: (text) ->
    canvas = document.getElementById('myCanvas')
    ctx = canvas.getContext('2d')
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    textString = text
    textWidth = ctx.measureText(textString).width
    ctx.fillText textString, canvas.width / 2 - (textWidth / 2), 120


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
        React.DOM.form
          className: 'form-inline'
          onSubmit: @handleSubmit
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
      React.DOM.div
        className: 'Card'
        title: 'Text'
        React.DOM.div
          className: 'Card-header'
          React.DOM.h4
            className: 'title'
            'Text style'
        React.DOM.form
          className: 'form-inline'
          onSubmit: @handleSubmit
          React.DOM.select
            ref: 'font'
            className: 'form-control'
            select: 'Arial'
            data: fonts
            onChange: @handleChange
