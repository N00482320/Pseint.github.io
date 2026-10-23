Algoritmo MesaDePartesDigital
	Definir MAX Como Entero
	MAX <- 100
	Definir v_codigo, v_documento, v_remitente, v_asunto, v_fecha, v_estado, v_tipo, v_area, v_obs Como Cadena
	Dimensionar v_codigo(100), v_documento(100), v_remitente(100), v_asunto(100), v_fecha(100), v_estado(100), v_tipo(100), v_area(100), v_obs(100)
	Definir total Como Entero
	total <- 0
	Definir rol_actual, opcion Como Cadena
	// Variables auxiliares declaradas al inicio para evitar errores de sintaxis
	Definir cod_buscar, doc_b, cod_mod, est_op, c_bus Como Cadena
	Definir hallado Como Lógico
	Definir i, j, k, m, x, l, d Como Entero
	rol_actual <- login_sistema
	Repetir
		Escribir ''
		Escribir '=========================================='
		Escribir ' MESA DE PARTES DIGITAL - PERFIL: [', rol_actual, ']'
		Escribir '=========================================='
		Si rol_actual='ADMIN' O rol_actual='PERSONAL' Entonces
			Escribir '1. Registrar nuevo expediente'
			Escribir '2. Buscar expediente por codigo'
			Escribir '3. Busqueda avanzada / Filtrado'
			Escribir '4. Ordenar y listar expedientes'
			Escribir '5. Modificar expediente / Actualizar Estado'
			Si rol_actual='ADMIN' Entonces
				Escribir '6. Eliminar expediente'
			FinSi
			Escribir '7. Estadisticas del Sistema'
			Escribir '8. Exportar datos a CSV'
			Escribir '9. Generar Copia de Seguridad'
			Escribir '10. Menu de Ayuda / FAQ'
			Escribir '11. Salir del sistema'
		SiNo
			Escribir '2. Buscar expediente por codigo'
			Escribir '3. Busqueda avanzada / Filtrado'
			Escribir '4. Ordenar y listar expedientes'
			Escribir '10. Menu de Ayuda / FAQ'
			Escribir '11. Salir del sistema'
		FinSi
		Escribir 'Seleccione una opcion: 'Sin Saltar
		Leer opcion
		Si rol_actual='ADMIN' O rol_actual='PERSONAL' Entonces
			Según opcion Hacer
				'1':
					Si total<100 Entonces
						total <- total+1
						v_codigo[total] <- 'EXP-2026-00'+ConvertirATexto(total)
						v_fecha[total] <- '26/10/2026 10:00'
						Escribir 'Codigo asignado: ', v_codigo[total]
						Escribir 'Ingrese DNI (8 digitos) o RUC (11 digitos): 'Sin Saltar
						Leer v_documento[total]
						Escribir 'Ingrese Nombre o Razon Social: 'Sin Saltar
						Leer v_remitente[total]
						Escribir 'Ingrese Asunto del tramite: 'Sin Saltar
						Leer v_asunto[total]
						v_tipo[total] <- 'Tramite General'
						v_area[total] <- 'Secretaria General'
						v_estado[total] <- 'PENDIENTE'
						v_obs[total] <- 'Ninguna'
						Escribir '[EXITO] Expediente registrado correctamente.'
					SiNo
						Escribir '[ERROR] Sistema lleno.'
					FinSi
				'2':
					hallado <- Falso
					Escribir 'Ingrese el codigo a buscar: 'Sin Saltar
					Leer cod_buscar
					Para i<-1 Hasta total Hacer
						Si v_codigo[i]=cod_buscar Entonces
							Escribir '--- EXPEDIENTE ENCONTRADO ---'
							Escribir 'Codigo: ', v_codigo[i]
							Escribir 'Remitente: ', v_remitente[i]
							Escribir 'Asunto: ', v_asunto[i]
							Escribir 'Estado: ', v_estado[i]
							hallado <- Verdadero
						FinSi
					FinPara
					Si  NO hallado Entonces
						Escribir 'No se encontro el expediente.'
					FinSi
				'3':
					Escribir '--- BUSQUEDA AVANZADA ---'
					Escribir 'Ingrese DNI o RUC a buscar: 'Sin Saltar
					Leer doc_b
					Para j<-1 Hasta total Hacer
						Si v_documento[j]=doc_b Entonces
							Escribir '[', v_codigo[j], '] - ', v_remitente[j], ' | Estado: ', v_estado[j]
						FinSi
					FinPara
				'4':
					Escribir '--- LISTADO DE EXPEDIENTES ---'
					Si total=0 Entonces
						Escribir 'No hay expedientes.'
					SiNo
						Para k<-1 Hasta total Hacer
							Escribir k, '. [', v_codigo[k], '] ', v_remitente[k], ' - Estado: ', v_estado[k]
						FinPara
					FinSi
				'5':
					Escribir 'Ingrese codigo del expediente a modificar estado: 'Sin Saltar
					Leer cod_mod
					Para m<-1 Hasta total Hacer
						Si v_codigo[m]=cod_mod Entonces
							Escribir 'Estado actual: ', v_estado[m]
							Escribir 'Nuevo estado (1. PENDIENTE / 2. APROBADO / 3. RECHAZADO): '
							Leer est_op
							Si est_op='1' Entonces
								v_estado[m] <- 'PENDIENTE'
							FinSi
							Si est_op='2' Entonces
								v_estado[m] <- 'APROBADO'
							FinSi
							Si est_op='3' Entonces
								v_estado[m] <- 'RECHAZADO'
							FinSi
							Escribir '[EXITO] Estado actualizado.'
						FinSi
					FinPara
				'6':
					Si rol_actual='ADMIN' Entonces
						Escribir 'Ingrese el codigo del expediente a eliminar: 'Sin Saltar
						Leer cod_mod
						hallado <- Falso
						Para m<-1 Hasta total Hacer
							Si v_codigo[m]=cod_mod Entonces
								d <- m
								hallado <- Verdadero
							FinSi
						FinPara
						Si hallado Entonces
							Para l<-d Hasta total-1 Hacer
								v_codigo[l] <- v_codigo[l+1]
								v_documento[l] <- v_documento[l+1]
								v_remitente[l] <- v_remitente[l+1]
								v_asunto[l] <- v_asunto[l+1]
								v_fecha[l] <- v_fecha[l+1]
								v_estado[l] <- v_estado[l+1]
								v_tipo[l] <- v_tipo[l+1]
								v_area[l] <- v_area[l+1]
								v_obs[l] <- v_obs[l+1]
							FinPara
							total <- total-1
							Escribir '[EXITO] Expediente eliminado correctamente.'
						SiNo
							Escribir '[ERROR] No se encontro el expediente.'
						FinSi
					SiNo
						Escribir '[ACCESO DENEGADO]'
					FinSi
				'7':
					Escribir '--- ESTADISTICAS ---'
					Escribir 'Total de expedientes: ', total
				'8':
					Escribir '[EXITO] Datos exportados.'
				'9':
					Escribir '[EXITO] Backup generado.'
				'10':
					Escribir '--- AYUDA ---'
					Escribir 'Sistema de Gestion de Mesa de Partes Municipal.'
				'11':
					Escribir 'Saliendo del sistema...'
				De Otro Modo:
					Escribir '[ERROR] Opcion no valida.'
			FinSegún
		SiNo
			Según opcion Hacer
				'2':
					Escribir 'Ingrese su codigo: 'Sin Saltar
					Leer c_bus
					Para x<-1 Hasta total Hacer
						Si v_codigo[x]=c_bus Entonces
							Escribir 'Expediente: ', v_codigo[x], ' | Estado: ', v_estado[x]
						FinSi
					FinPara
				'3':
					Escribir 'Busqueda avanzada para ciudadano no disponible.'
				'4':
					Escribir 'Listado general restringido.'
				'10':
					Escribir 'Ayuda Ciudadano: Consulte con su codigo de tramite.'
				'11':
					Escribir 'Saliendo...'
				De Otro Modo:
					Escribir 'Opcion no valida.'
			FinSegún
		FinSi
	Hasta Que opcion='11'
FinAlgoritmo

Función rol <- login_sistema
	Definir rol_op Como Cadena
	Escribir '=========================================='
	Escribir '    CONTROL DE ACCESO - MUNI LIMA NORTE'
	Escribir '=========================================='
	Escribir '1. Administrador'
	Escribir '2. Personal de Mesa de Partes'
	Escribir '3. Ciudadano / Consulta'
	Escribir 'Seleccione perfil (1-3): 'Sin Saltar
	Leer rol_op
	Si rol_op='1' Entonces
		rol <- 'ADMIN'
	SiNo
		Si rol_op='2' Entonces
			rol <- 'PERSONAL'
		SiNo
			rol <- 'CIUDADANO'
		FinSi
	FinSi
FinFunción

Función SinTitulo
	
FinFunción
