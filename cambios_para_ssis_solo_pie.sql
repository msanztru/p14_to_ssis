
--Inicio Pie--
			--guardar el valor de @@ROWCOUNT si no lo habíamos hecho ya
			IF @rc IS NULL SET @rc = @@ROWCOUNT

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
					@p_num_registros = spvarxxx --@@ROWCOUNT o @rc

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
--Fin Pie--