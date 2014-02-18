class GistDecorator < Draper::Decorator
  
  delegate_all

  def highlight(css_class = 'highlight')
    formatter = Rouge::Formatters::HTML.new(:css_class => css_class)
    lexer     = Rouge::Lexers::Shell.new
    formatter.format(lexer.lex(model.code)).html_safe
  end

end