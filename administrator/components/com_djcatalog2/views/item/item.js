/**
 * @version 3.x
 * @package DJ-Catalog2
 * @copyright Copyright (C) 2013 DJ-Extensions.com, All rights reserved.
 * @license DJ-Extensions.com Proprietary Use License
 * @author url: http://dj-extensions.com
 * @author email contact@dj-extensions.com
 * @developer Michał Olczyk michal.olczyk@design-joomla.eu
 *
 */

window.addEvent('domready', function() {
	var djItemPriceInput = document.id('jform_price');
	djItemPriceInput.addEvents({
		'keyup' : function(e){djValidatePrice(djItemPriceInput);},
		'change' : function(e){djValidatePrice(djItemPriceInput);},
		'click' : function(e){djValidatePrice(djItemPriceInput);}
	});
	
	var djItemSpecialPriceInput = document.id('jform_special_price');
	djItemSpecialPriceInput.addEvents({
		'keyup' : function(e){djValidatePrice(djItemSpecialPriceInput);},
		'change' : function(e){djValidatePrice(djItemSpecialPriceInput);},
		'click' : function(e){djValidatePrice(djItemSpecialPriceInput);}
	});
	
	var djFieldGroup = document.id('jform_group_id');
	djFieldGroup.onchange=(function(){
		djRenderForm();
	});
	/*djFieldGroup.addEvent('change',function(){
		djRenderForm();
	});*/
	
	//if (document.id('jform_id').value > 0 && document.id('jform_group_id').value > 0) {
		djRenderForm();
	//}
});

function djValidatePrice(priceInput) {
		var r = new RegExp("\,", "i");
		var t = new RegExp("[^0-9\,\.]+", "i");
		priceInput.setProperty('value', priceInput.getProperty('value')
				.replace(r, "."));
		priceInput.setProperty('value', priceInput.getProperty('value')
				.replace(t, ""));
}
function djRenderForm() {
	var itemId = document.id('jform_id').value;
	
	if (!itemId || itemId == 0) {
		var vars = {};
	    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
	        vars[key] = value;
	    });
	    if (vars['id'] > 0) {
	    	itemId = vars['id'];
	    }
	}
	var groupId= document.id('jform_group_id').value;
	
	if (typeof ( document.id('itemAttributes') ) !== 'undefined') {
		
		var textareas = document.id('itemAttributes').getElements('textarea.nicEdit');
		if (textareas) {
			textareas.each(function(textarea){
				if (textarea.nicEditor != null && textarea.nicEditor) {
					textarea.nicEditor.removeInstance(textarea.id);
					textarea.nicEditor = null;
				}
				//tinyMCE.execCommand('mceFocus', false, textarea.id);  
				//tinyMCE.execCommand('mceRemoveControl', false, textarea.id);  
			});
		}
		
		var calendars = document.id('itemAttributes').getElements('input.djc_calendar');
		if (calendars) {
			calendars.each(function(calendar){
				if (typeof(calendar.hasCalendar) != 'undefined') {
					calendars.hasCalendar = null;
				}
			});
		}
		
		ajax = new Request(
				{
					url : 'index.php?option=com_djcatalog2&view=item&layout=extrafields&format=raw&itemId='
							+ itemId
							+ '&groupId='
							+ groupId,
					onSuccess : function(resp) {
						document.id('itemAttributes').innerHTML = resp;
						var textareas = document.id('itemAttributes').getElements('textarea.nicEdit');
						if (textareas) {
							var myNicEditor = new nicEditor();
							textareas.each(function(textarea, index){
								textarea.nicEditor = new nicEditor({fullPanel : true, xhtml: true, iconsPath: '../components/com_djcatalog2/assets/nicEdit/nicEditorIcons.gif'}).panelInstance(textarea.id,{hasPanel : true});
								textarea.nicEditor.addEvent('blur',function(){
									if (textarea.nicEditor) {
										var editor = textarea.nicEditor.instanceById(textarea.id);
										if (editor) {
											editor.saveContent();
										}
									}
								});
							});
						}
						
						var calendars = document.id('itemAttributes').getElements('input.djc_calendar');
						if (calendars) {
							calendars.each(function(calendar){
								if (typeof(calendar.hasCalendar) === 'undefined') {
									Calendar.setup({
										inputField: calendar.id,
										ifFormat: "%Y-%m-%d",
										//ifFormat: "%Y-%m-%d %H:%M:%S",
										daFormat: "%Y-%m-%d",
										button: calendar.id + "_img",
										align: "Tl",
										singleClick: true
									});
									calendar.hasCalendar = true;
								}
							});
						}
						
						/*textareas.each(function(textarea){
							tinyMCE.execCommand('mceAddControl', false, textarea.id);
						});*/
					}.bind(this)
				});
		ajax.send.delay(10, this.ajax);
	}
}