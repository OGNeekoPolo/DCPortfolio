jQuery(document).on 'turbolink:load', ->
  comments = $('#comments')
  if comments.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "BlogsChannel"
      blog_id: comments.data('blog-id')
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      comments.append data['comment']
    send_comment: (comment, blog_id) ->
      @perform 'send_comment', comment: comment, blog_id: blog_id
  $('#new_comment').submit (e) ->
    $this = $(this)
    text_area = $this.find('#comment_content')
    if $.trim(text_area.val()).lenght > 1
      App.global_chat.send_comment text_area.val(),
      comments.data('blog-id')
      text_area.val('')
    e.preventDefault()
    return false
