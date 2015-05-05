# Development Seed Test - Portuguese BR

namespace :redmine do
  desc "Atualiza usuarios com user_type_id nulo para o tipo Pessoa fisica"
  namespace :plugins do
  	namespace :tpa do
  		namespace :development do
		  	task seed: :environment do

		  	  begin
				    STDOUT.puts "Entre com o login do Autor do modelo"
    				input = STDIN.gets.strip.downcase
  				end until (!input.blank? and User.where('login = ?', input).any?)

				  puts('Criando modelo de avaliação...')
					template = Appraisal.new(
						template: true, 
						name: 'AVALIAÇÃO DE DESEMPENHO INDIVIDUAL', 
						description: 'Avaliação de desempenho individual para a manutenção da Gratificação Temporária do Sistema de Administração dos Recursos de Informação e Informática - GSISP, conforme dispõe o art. 290 da Lei nº 11.907, de 2 de fevereiro de 2009, e os arts. 10, 11 e 12 da Portaria MP nº 89, de 23 de abril de 2009.',
						author_id: User.find_by_login(input).id
					)

					puts('Criando avaliação...')
					questions_and_options = []

					q1 = AppraisalQuestion.new(content: "DEDICAÇÃO AO TRABALHO E COMPROMISSO COM A INSTITUIÇÃO")
					q1.appraisal_question_options << AppraisalQuestionOption.new(content: "Demonstrar entusiasmo pelo trabalho, satisfação pessoal e estímulo para a realização de suas tarefas.")
					q1.appraisal_question_options << AppraisalQuestionOption.new(content: "Demonstrar compromisso com a missão, os planos e as metas da unidade de trabalho.")
					q1.appraisal_question_options << AppraisalQuestionOption.new(content: "Propor planos de ação para a área de atuação, a fim de viabilizar os planos e as metas da unidade de trabalho.")
					q1.appraisal_question_options << AppraisalQuestionOption.new(content: "Sugerir mudanças nos processos de trabalho que concorram para o contínuo aperfeiçoamento da área de atuação.")
					q1.appraisal_question_options << AppraisalQuestionOption.new(content: "Comparecer com regularidade e prontidão ao local de trabalho, cumprindo o horário preestabelecido para sua jornada diária de trabalho.")
					questions_and_options << q1

					q2 = AppraisalQuestion.new(content: "CONHECIMENTO DO TRABALHO E AUTODESENVOLVIMENTO")
					q2.appraisal_question_options << AppraisalQuestionOption.new(content: "Conhecer os processos de trabalho da área de atuação e contribuir para os resultados da unidade de trabalho.")
					q2.appraisal_question_options << AppraisalQuestionOption.new(content: "Manter-se atualizado com tecnologias, conhecimentos e habilidades exigidos pelas atividades da área de atuação.")
					q2.appraisal_question_options << AppraisalQuestionOption.new(content: "Buscar os recursos internos e externos que concorram para o autodesenvolvimento.")
					q2.appraisal_question_options << AppraisalQuestionOption.new(content: "Disseminar os conhecimentos adquiridos.")
					questions_and_options << q2

					q3 = AppraisalQuestion.new(content: "QUALIDADE TÉCNICA DO TRABALHO E PRODUTIVIDADE")
					q3.appraisal_question_options << AppraisalQuestionOption.new(content: "Realizar o trabalho com habilidade e com economia de tempo, sem perda da qualidade.")
					q3.appraisal_question_options << AppraisalQuestionOption.new(content: "Alcançar, em tempo hábil, os resultados negociados com a chefia imediata.")
					q3.appraisal_question_options << AppraisalQuestionOption.new(content: "Executar os trabalhos com grau de exatidão, correção e clareza.")
					q3.appraisal_question_options << AppraisalQuestionOption.new(content: "Agilizar os processos da área de atuação, visando a excelência do atendimento e dos serviços.")
					questions_and_options << q3

					q4 = AppraisalQuestion.new(content: "CAPACIDADE DE INICIATIVA")
					q4.appraisal_question_options << AppraisalQuestionOption.new(content: "Identificar os aspectos positivos e negativos do seu trabalho e propor aperfeiçoamentos.")
					q4.appraisal_question_options << AppraisalQuestionOption.new(content: "Identificar e resolver situações da sua rotina de trabalho, simples ou complexas.")
					q4.appraisal_question_options << AppraisalQuestionOption.new(content: "Acrescentar novos conhecimentos e inovações nos trabalhos sob sua responsabilidade.")
					q4.appraisal_question_options << AppraisalQuestionOption.new(content: "Antecipar-se aos problemas, pesquisando e aplicando as melhores práticas em prol dos resultados da área de atuação.")
					questions_and_options << q4

					q5 = AppraisalQuestion.new(content: "DISCIPLINA E RELACIONAMENTO INTERPESSOAL")
					q5.appraisal_question_options << AppraisalQuestionOption.new(content: "Cumprir as determinações para o funcionamento da unidade de trabalho.")
					q5.appraisal_question_options << AppraisalQuestionOption.new(content: "Possuir adequada capacidade de relacionamento com as pessoas, demonstrando habilidade no trato interpessoal.")
					q5.appraisal_question_options << AppraisalQuestionOption.new(content: "Atuar para minimizar as situações de conflito surgidas na unidade de trabalho.")
					q5.appraisal_question_options << AppraisalQuestionOption.new(content: "Promover ações no sentido de integrar o seu grupo de trabalho com os demais grupos da unidade de exercício.")
					questions_and_options << q5

					q6 = AppraisalQuestion.new(content: "TRABALHO EM EQUIPE")
					q6.appraisal_question_options << AppraisalQuestionOption.new(content: "Adotar mudanças individuais a partir das críticas recebidas.")
					q6.appraisal_question_options << AppraisalQuestionOption.new(content: "Assumir, de forma espontânea, atividades de apoio aos colegas em questões de trabalho.")
					q6.appraisal_question_options << AppraisalQuestionOption.new(content: "Compartilhar recursos, informações, experiências e idéias de maneira espontânea, visando atingir as metas da área de atuação.")
					q6.appraisal_question_options << AppraisalQuestionOption.new(content: "Estimular os colegas de trabalho e superiores, reconhecendo e valorizando os resultados obtidos.")
					questions_and_options << q6

					template.appraisal_questions << questions_and_options
					template.save

					puts('Dados inseridos com sucesso!')
			  end
  		end
  	end
	end
end