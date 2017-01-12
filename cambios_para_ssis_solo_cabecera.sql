AS
BEGIN

--Inicio cabecera--

	SET NOCOUNT ON

	BEGIN TRY

		--declaración de variables
		DECLARE	@bd varchar(50) = 'dbn1_stg_dhyf',
				@esquema varchar(50) = 'dbo',
				@objeto varchar(200) = 'spxxx',
				@fecha_inicio datetime = GETDATE(),
				@num_registros int = NULL,
				@id int = NULL,
				@rc int,
				@count_all int,
				@count_ins int,
				@idx_reclim int

		--insertar en el log el comienzo de la ejecución de este SP
		EXEC dbn1_norm_dhyf.audit.spn1_insertar_log
				@p_id_carga = @p_id_carga,
				@p_bd = @bd,
				@p_esquema = @esquema,
				@p_objeto = @objeto,
				@p_fecha_inicio = @fecha_inicio,
				--@p_descripcion_warning solo informarlo en los SP de warnings, para el resto insertará null
				@p_out_id = @id OUT

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

--Fin Cabecera--