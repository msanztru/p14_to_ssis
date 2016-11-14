PRINT 'cargar_normalizado_maestros_modelos_informativos.sql'
GO

USE dbn1_stg_dhyf
GO

IF EXISTS (SELECT 1 FROM dbn1_stg_dhyf.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA='dbo' AND ROUTINE_NAME='spn1_cargar_normalizado_maestros_modelos_informativos_ssis' AND ROUTINE_TYPE='PROCEDURE')
DROP PROCEDURE dbo.spn1_cargar_normalizado_maestros_modelos_informativos_ssis;
GO

CREATE PROCEDURE dbo.spn1_cargar_normalizado_maestros_modelos_informativos_ssis(@p_id_carga int)AS
BEGIN
--- Inicio cabecera
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE	@bd					varchar(50)	= 'dbn1_stg_dhyf',
				@esquema			varchar(50)	= 'dbo',
				@objeto				varchar(200)= 'spn1_cargar_normalizado_maestros_modelos_informativos_ssis',
				@fecha_inicio		datetime	= GETDATE(),
				@num_registros		int			= NULL,
				@id					int			= NULL,
				@rc					int,
				@count_all			int,
				@count_ins			int,
				@idx_reclim			int

		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
					@p_id_carga		= @p_id_carga,
					@p_bd			= @bd,
					@p_esquema		= @esquema,
					@p_objeto		= @objeto,
					@p_fecha_inicio	= @fecha_inicio,
					--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
					@p_out_id		= @id OUT

		--ejecutar la lógica de negocio solo si todas las precondiciones están en estado 'OK'
		IF dbn1_norm_dhyf.audit.fnn1_precondiciones_ok(@bd,@esquema,@objeto) = 1
		BEGIN

			--actualizar la tabla de precondiciones para indicar que este SP se está ejecutando y evitar que se lancen SP dependientes de él
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'EJECUTANDO',
					@p_fecha_inicio_precondicion = @fecha_inicio,
					@p_fecha_fin_precondicion = NULL,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto
					---Fin Cabecera

  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclaves @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_presentacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_presentacion_integridad_mf @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_socio @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_naturaleza @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_naturaleza_193 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_identificacion_fondo @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_operacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_operacion_factura @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_modalidad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_registro @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_pago @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_codigo @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_codigo @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_alta @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_perceptor @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_cuenta @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_donacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_bien @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_189 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_170 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_171 @log;	
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_199 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_importe_integridad_346 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_180 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_administracion_hacienda @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_administracion_hacienda_integridad @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_maestros_mf @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_declaracion_integridad_mf_decl @log
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_maestros_af @log;
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante @log;   1
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante_integridad_internos @log; 2
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_declarante_integridad_externos @log; 3
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso @log;	4
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_externos @log;	5
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_traspaso_integridad_internos @log;	6
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_198_integridad_192_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_integridad	@log;  
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192 @log;	7
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_externos @log;	8
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_claves_operacion_192_integridad_internos @log;  9
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192 @log;  10
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_externos	@log;	11
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipos_operacion_192_integridad_internos	@log;	12  
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia @log;  13
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia_integridad_externos @log;  14
  --EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_claves_residencia_integridad_internos @log;  15
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_intervencion_operacion_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_clave_operacion_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_origen_operacion_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_situacion_inmueble_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclave_operacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_subclave_operacion_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181 @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_internos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_normalizado_mi_tipo_identificacion_181_integridad_externos @log;
  EXECUTE dbn1_stg_dhyf.dbo.spn1_cargar_maestro_no_identificados @log;

  --- Inicio Pie
				DECLARE @fecha_fin_ok_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'OK',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_ok_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

			END

			ELSE
			BEGIN

				--actualizar la tabla de precondiciones para indicar que la ejecución de este SP queda pendiente y evitar que se lancen los SP dependientes de él
				DECLARE @fecha_fin_pdte_precondicion datetime = GETDATE()
				EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
						@p_estado_precondicion = 'PDTE',
						@p_fecha_inicio_precondicion = NULL,
						@p_fecha_fin_precondicion = @fecha_fin_pdte_precondicion,
						@p_bd_precondicion = @bd,
						@p_esquema_precondicion = @esquema,
						@p_objeto_precondicion = @objeto

				--insertar warning avisando de que no se ha ejecutado la carga por no cumplirse todas las precondiciones
				DECLARE @id_warning_precondiones int
				DECLARE @descripcion_warning_precondiciones varchar(4000) = @bd + '.' + @esquema + '.' + @objeto +
																			' no ha cargado ningún registro porque no se han cumplido todas sus precondiciones'
				EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
							@p_id_carga		= @p_id_carga,
							@p_bd			= @bd,
							@p_esquema		= @esquema,
							@p_objeto		= @objeto,
							@p_fecha_inicio	= @fecha_inicio,
							@p_descripcion_warning = @descripcion_warning_precondiciones,
							@p_out_id		= @id_warning_precondiones OUT

			END

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_correcto
					@p_id = @id,
					@p_num_registros = @@ROWCOUNT --@@ROWCOUNT o @rc

	END TRY

	BEGIN CATCH

			--actualizar la tabla de precondiciones para indicar que este SP ha fallado y evitar que se lancen SP dependientes de él
			DECLARE @fecha_fin_error_precondicion datetime = GETDATE()
			EXEC dbn1_norm_dhyf.audit.spn1_actualizar_tbn1_precondiciones_carga_dwh
					@p_estado_precondicion = 'ERROR',
					@p_fecha_inicio_precondicion = NULL,
					@p_fecha_fin_precondicion = @fecha_fin_error_precondicion,
					@p_bd_precondicion = @bd,
					@p_esquema_precondicion = @esquema,
					@p_objeto_precondicion = @objeto

		DECLARE @linea_error int,
				@objeto_error varchar(200),
				@descripcion_error varchar(4000)

		SELECT	@linea_error = ERROR_LINE(),
				@objeto_error = ERROR_PROCEDURE(),
				@descripcion_error = SUBSTRING(ERROR_MESSAGE(),1,4000)

		EXEC dbn1_norm_dhyf.audit.spn1_actualizar_log_error
					@p_id = @id,
					@p_linea_error = @linea_error,
					@p_objeto_error = @objeto_error,
					@p_descripcion_error = @descripcion_error
					/*si es carga de dim o fact añadir ;THROW*/
	END CATCH
	---Fin Pie



END

GO

