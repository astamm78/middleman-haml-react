###* @jsx React.DOM ###

Content = React.createClass
  componentWillMount: ->
    @_getJSON()

  getInitialState: ->
    data: null

  _getJSON: ->
    $.ajax 'content-example.json',
      type: 'get'
      dataType: 'json'
      success: (data) =>
        @setState data: data

  render: ->
    content = switch @state.data
      when null
        `<p>Loading...</p>`
      else
        `(
          <span>
            <h1>{this.state.data.title}</h1>
            <h2>{this.state.data.subhead}</h2>
            <p>
              Download at: <a href={this.state.data.link} target="_blank">https://github.com/astamm78/middleman-haml-react</a>.
            </p>
          </span>
        )`

    `(
      <div>
        {content}
      </div>
    )`


React.renderComponent Content(), document.getElementById('react-content')