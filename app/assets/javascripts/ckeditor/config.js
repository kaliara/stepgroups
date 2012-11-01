/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	config.toolbar = 'Custom';
	config.toolbar_Admin = [['Styles', 'Bold', 'Italic','Underline','TextColor','Format','Font','FontSize', 'NumberedList', 'BulletedList','JustifyLeft','JustifyCenter','JustifyRight','Blockquote', '-', 'Link', 'Unlink','-','Image','-','RemoveFormat','Source']];
	config.toolbar_Custom = [[ 'Blockquote', 'Bold', 'Italic','Underline','TextColor','FontSize', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink']];
  config.toolbarCanCollapse = false;
  config.bodyClass = 'ckeditor';
  config.disableNativeSpellChecker = false;  
};
