/**
 * This settings is the result of the migration of the configuration file from the previous version of
 * FCK Editor so that the exposed features are the same (@see richtext.config.js).
 */
CKEDITOR.editorConfig = function( config )
{

     /*
      * DEFINITION OF THE TOOLBARS
      *
      * A new toolbar is defined this way: config.toolbar_<tbName> where <tbName> is the name of the toolbar that can
      * be referenced by config.toolbar.
      */

    config.toolbar_SalesforceBasic = [
        ['Undo', 'Redo'],
        ['Bold', 'Italic', 'Underline', 'Strike'],
        ['-', 'Link', 'SfdcImage'],
        ['-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight'],
        ['-', 'BulletedList', 'NumberedList'],
        ['Indent', 'Outdent']
    ];
	
    config.toolbar_Custome=[
							['Font','FontSize','TextColor','BGColor','Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat','NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
							'/',
                             ['Source','-','SpellChecker','-','Undo','Redo','Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt','-','Link','Unlink','Anchor','-','SfdcImage','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ]
	];
	config.toolbar_Image=[							
                             ['SfdcImage']
	];
    config.toolbar_Email = [
        ['SfdcSwitchToText','Font', 'FontSize'],
        ['Bold','Italic','Underline'],
        ['JustifyLeft','JustifyCenter', 'JustifyRight'],
        ['BulletedList', 'NumberedList', 'Indent', 'Outdent']
    ];

    config.toolbar_SalesforceLight = [
        ['Bold', 'Italic'],
        ['-', 'Link'],
        ['-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight'],
        ['-', 'BulletedList'],
        ['-', 'FontSize']
    ];

    config.toolbar_Knowledge = [
        ['Source'],
        ['Undo', 'Redo'],
        ['Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat'],
        ['Table'],
        ['Link', 'Unlink', 'Anchor'],
        ['SfdcImage'],
        ['JustifyLeft','JustifyCenter', 'JustifyRight'],
        ['BulletedList', 'NumberedList', 'Indent', 'Outdent'],
        ['Format', 'Font', 'FontSize', 'TextColor', 'BGColor']
    ];

    config.toolbar_Visualforce = [
        ['Undo', 'Redo'],
        ['Bold', 'Italic', 'Underline', 'Strike'],
        ['Link', 'SfdcImage'],
        ['JustifyLeft','JustifyCenter', 'JustifyRight'],
        ['BulletedList', 'NumberedList', 'Indent', 'Outdent'],
    ];

    config.toolbarCanCollapse = false;
    config.resize_enabled = false;

    /*
     * Deactivate:
     * - The Element path component (RTE's "status bar")
     * - Resizing ability (editing area maximization, resizing)
     * - Context menus
     * - Standard image dialog
     */
    config.removePlugins = 'elementspath,maximize,resize,image';

    config.extraPlugins = 'sfdcImage,sfdcSwitchToText';


    /*
     * Hide some dialog tabs:
     * - Image dialog: advanced and link tabs.
     * - Link dialog: advanced and target tabs
     */
    config.removeDialogTabs = 'link:advanced;table:advanced'; //  FCKConfig.ImageDlgHideLink;FCKConfig.ImageDlgHideAdvanced

    config.skin = 'sfdc';

    config.enterMode = CKEDITOR.ENTER_BR;
    config.shiftEnterMode = CKEDITOR.ENTER_P;
    config.forcePasteAsPlainText = false;
    config.forceSimpleAmpersand = true;

    // Salesforce specific entries (non-cke)
    config.imageUploadAllowedExtensions  = ".(jpg|gif|jpeg|png|bmp|jfif|jpe|pjpeg)$" ;
    config.imageUploadDeniedExtensions   = "" ;
};
