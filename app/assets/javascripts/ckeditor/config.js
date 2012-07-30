/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	config.toolbar = 'Custom';
	config.toolbar_Custom = [['Styles', 'Bold', 'Italic','Underline','TextColor','Format','Font','FontSize', 'NumberedList', 'BulletedList','JustifyLeft','JustifyCenter','JustifyRight','Blockquote', '-', 'Link', 'Unlink','-','Image','-','RemoveFormat','Source']];
  // config.contentsCss = '/assets/application.css';
  config.toolbarCanCollapse = false;
  config.bodyClass = 'ckeditor';
  // config.dialog_backgroundCoverColor = '#000';
  config.disableNativeSpellChecker = false;  
  config.width = 850;
};
