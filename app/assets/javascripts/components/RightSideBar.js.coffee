DOM = React.DOM
Header = React.createClass
  displayName: "Campaign-Header"
  getInitialState: ->
    header: ''
    desc: ''
    font: 'Arial'
    size: '42px'
  valueKeyup: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
    HValue = document.getElementById("HeaderValue");
    HValue.innerText = "This is your Header: "+ e.target.value;
    @insertTextToCanvas(e.target.value)
  insertTextToCanvas: (text) ->
    canvas = document.getElementById('myCanvas')
    ctx = canvas.getContext('2d')
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.font="#{@props.size} #{@props.font}";
    textString = text
    textWidth = ctx.measureText(textString).width
    ctx.fillText textString, canvas.width / 2 - (textWidth / 2), 100

  render: ->
    DOM.div
      className: 'form-group'
      DOM.input
        type: 'text'
        className: 'form-control'
        placeholder: 'Header'
        name: 'header'
        value: @props.header
        onChange: @valueKeyup
      DOM.label
        className: 'Main-subtitle'
        "Header of your campaign"

fontDropdown = React.createClass
  displayName: "FontDropdown"
  getDefaultProps: ->
    header: ''
    font: 'Arial'
  onFontChange: (e) ->
    @props.onChange(e.target.value)

  render: ->
      DOM.div
        className: "form-group"
        DOM.label
          className: 'subtitle'
          'Font'
        DOM.select
          className: "form-control"
          onChange: @onFontChange
          value: @props.font
          DOM.option(value: font, key: font, font) for font in ['Arial', 'Georgia', 'Helvetica']

sizeDropdown = React.createClass
  displayName: "SizeDropdown"
  getDefaultProps: ->
    header: ''
    size: '42px'
  onSizeChange: (e) ->
    @props.onChange(e.target.value)

  render: ->
      DOM.div
        className: "form-group"
        DOM.label
          className: 'subtitle'
          'Size'
        DOM.select
          className: "form-control"
          onChange: @onSizeChange
          value: @props.size
          DOM.option(value: size, key: size, size) for size in [ '8px','10px','12px','14px','16px','18px','20px','22px','26px','32px','36px','42px','48px','54px' ]


RightSidbar = React.createClass
  displayName: "RightSidbar"
  getInitialState: ->
    {
      campaign: {
        header: "",
        font: "Arial",
        size: "42px"
      }
    }
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valueKeyup2: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
    DValue = document.getElementById("DescValue");
    DValue.innerText = "This is your description: "+ e.target.value;
    @insertTextToCanvas2(e.target.value)
  insertTextToCanvas2: (text) ->
    canvas = document.getElementById('myCanvas')
    ctx = canvas.getContext('2d')
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    textString = text
    textWidth = ctx.measureText(textString).width
    ctx.fillText textString, canvas.width / 2 - (textWidth / 2), 120
  fontChanged: (newFont) ->
    @state.campaign.font = newFont
    @forceUpdate()
  sizeChanged: (newSize) ->
    @state.campaign.size = newSize
    @forceUpdate()
  render: ->
    DOM.form
      onSubmit: @handleSubmit
      DOM.div
        className: 'Sidebar'
        DOM.div
          className: 'Card'
          DOM.div
            className: 'Card-header'
            DOM.h4
              className: 'title'
              'Header'
          header
            id: "header"
            placeholder: "Header"
            value: @state.campaign.header
            font: @state.campaign.font
            size: @state.campaign.size
        DOM.div
          className: 'Card'
          DOM.div
            className: 'Card-header'
            DOM.h4
              className: 'title'
              'Text Style'
          fontDropdown
            id: "font-dropdown"
            onChange: @fontChanged
            header: @state.campaign.header
            font: @state.campaign.font
            size: @state.campaign.size
          sizeDropdown
            id: "size-dropdown"
            onChange: @sizeChanged
            header: @state.campaign.header
            font: @state.campaign.font
            size: @state.campaign.size

header = React.createFactory(Header)
fontDropdown = React.createFactory(fontDropdown)
sizeDropdown = React.createFactory(sizeDropdown)
@Right = React.createFactory(RightSidbar)
