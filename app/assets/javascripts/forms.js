jQuery(document).on('ready page:load', function() {
  'use strict';

	// init formBuilder plugin
  $('#formBuilder').formBuilder({
  	controlPosition: 'left',
  	// editOnAdd: true,
    sortableControls: false,
    disableFields: [
      'button'
    ],
  	messages: {
  		button: 'Botão',
      text: 'Texto',
      checkbox: 'Caixa de seleção',
      checkboxGroup: 'Campos de Multipla Escolha',
      dateField: 'Data',
      header: 'Cabeçalho',
      paragraph: 'Parágrafo',
      hidden: 'Campo oculto',
      select: 'Menu suspenso',
      getStarted: 'Arraste um campo do direito a esta área',
      editorTitle: 'Elementos de formulário',
      radioGroup: 'Grupo de rádio',
      textArea: 'Área de texto',
      viewXML: 'Exibir XML',
      addOption: 'Adicionar Opção',
      allFieldsRemoved: 'Todos os campos foram removidos.',
      allowSelect: 'Permitir Seleção',
      autocomplete: 'Autocompletar',
      button: 'Botão',
      cannotBeEmpty: 'Este campo não pode estar vazio',
      checkboxGroup: 'Grupo de Caixa de seleção',
      checkbox: 'Checkbox',
      checkboxes: 'Checkboxes',
      className: 'Classe CSS',
      clearAllMessage: 'Tem certeza de que deseja remover todos os campos?',
      clearAll: 'Limpar',
      close: 'Fechar',
      copy: 'Copiar',
      dateField: 'Campo de Data',
      description: 'Texto de ajuda',
      descriptionField: 'Descrição',
      devMode: 'Modo desenvolvedor',
      editNames: 'Editar nomes',
      editorTitle: 'Elements Form',
      editXML: 'Editar XML',
      fieldDeleteWarning: false,
      fieldVars: 'Variáveis ​​do campo',
      fieldNonEditable: 'Este campo não pode ser editado.',
      fieldRemoveWarning: 'Tem certeza que deseja remover este campo?',
      fileUpload: 'Carregar Arquivo',
      formUpdated: 'Formulário atualizado',
      getStarted: 'Arraste um campo da esquerda para esta área',
      hide: 'Esconder',
      hidden: 'Campo oculto',
      label: 'Rótulo do campo',
      labelEmpty: 'Campo não pode estar vazio',
      limitRole: 'Limitar o acesso a uma ou mais das seguintes funções:',
      mandatory: 'Obrigatório',
      maxlength: 'Comprimento máximo',
      minOptionMessage: 'Este campo exige um mínimo de 2 opções',
      name: 'Nome',
      no: 'Não',
      off: 'Desligado',
      on: 'Ligado',
      option: 'Opção',
      optional: 'Opcional',
      optionLabelPlaceholder: 'Rótulo',
      optionValuePlaceholder: 'Valor',
      optionEmpty: 'Opcão necessária',
      paragraph: 'Parágrafo',
      placeholder: '文字段落',
      placeholders: {
        value: 'Valor',
        label: 'Rótulo',
        text: 'Digite algum texto',
        textarea: 'Digite algum texto',
        email: 'Digite seu email',
        placeholder: '',
        className: 'Classe CSS',
        password: 'Digite sua senha'
      },
      preview: 'Visualizar',
      radioGroup: 'Grupo de opção única',
      radio: 'Opção única',
      removeMessage: 'Remover elemento',
      remove: '&#215;',
      required: 'Obrigatório',
      richText: 'Editor de texto',
      roles: 'Acesso',
      save: 'Salvar',
      selectOptions: 'Opções',
      select: 'Selecione',
      selectColor: 'Selecione uma cor',
      selectionsMessage: 'Permitir várias seleções',
      size: 'Tamanho',
      sizes: {
        xs: 'Extra Pequeno',
        sm: 'Pequeno',
        m: 'Padrão',
        lg: 'Grande'
      },
      style: 'Estilo',
      styles: {
        btn: {
          'default': 'Padrão',
          danger: 'Vermelho',
          info: 'Azul',
          primary: 'Azul',
          success: 'Verde',
          warning: 'Laranja'
        }
      },
      subtype: 'Tipo',
      subtypes: {
        text: ['text', 'password', 'email', 'color'],
        button: ['button', 'submit']
      },
      text: 'Campo de Texto',
      textArea: 'Área de Texto',
      toggle: 'Alternar',
      warning: 'Aviso!',
      viewXML: '&lt;/&gt;',
      yes: 'Sim'
  	},
  	inputSets: [{
      label: 'Campo de texto',
      // name: 'customtext', // optional - one will be generated from the label if name not supplied
      // showHeader: true, // optional - Use the label as the header for this set of inputs
      fields: [
        {
          type: 'text',
          label: 'Pergunta',
          className: 'form-control',
          name: 'aaa',
          id: 'bbbb',
          value: 'cccc'
        }
      ]
    }],
    typeUserEvents: {
      'text': {
        onadd: function(fld) {
          var i = $('.frmb .form-field').size();

          $('label.field-label').html('Pergunta');

          $('.prev-holder input[type=text]', fld).attr('name', 'questions[' + i + '][title]');

          var type = getTypeId('text');
          $(fld).append("<input type='hidden' name='questions[" + i + "][field_type_id]' value='" + type + "'/>");
        }
      }
    },
    defaultFields: [questionsAsDefault()]
  });

  $('button.form-builder-save').on('click', function() {
    $('form').submit();
  });

});