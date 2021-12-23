extensions = []
templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'
project = u'Quick Reference Handbook'
copyright = u'Some Company'
author = u'Sime Engineer'
version = u'1.0'
release = u'1.0'
language = None
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']
pygments_style = 'sphinx'
todo_include_todos = False
html_theme = 'alabaster'
html_static_path = ['_static']
html_logo = 'logo.png'
html_sidebars = {
    '**': [
        'relations.html',
        'searchbox.html',
    ]
}
htmlhelp_basename = 'Quick Reference Handbook'
latex_engine = 'pdflatex'
latex_logo = 'logo.png'
latex_elements = {
    'papersize': 'a4paper',
    'preamble': '\\usepackage{mycustomstyle}',
    'extraclassoptions':',openany,oneside',

}
latex_additional_files = ['mycustomstyle.sty']
latex_documents = [
    (master_doc, 
     'quick-reference-handbook.tex', 
     u'Quick Reference Handbook',
     u'Example additive', 'manual'),
]
man_pages = [
    (master_doc, 
     'Quick Reference Handbook', 
     u'Quick Reference Handbook',
     [author], 
     1)
]
texinfo_documents = [
    (master_doc, 'Quick Reference Handbook', 
     u'Quick Reference Handbook',
     author, 
     'Example additive', 
     'Quick Reference Handbook'),
]