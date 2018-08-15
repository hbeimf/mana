defmodule EVM.Configuration.Homestead do
  defstruct contract_creation_cost: 53_000,
            has_delegate_call: true,
            max_signature_s: :secp256k1n_2,
            fail_contract_creation: true,
            fallback_config: EVM.Configuration.Frontier.new()

  def new do
    %__MODULE__{}
  end
end

defimpl EVM.Configuration, for: EVM.Configuration.Homestead do
  alias EVM.Configuration

  @spec contract_creation_cost(Configuration.t()) :: integer()
  def contract_creation_cost(config), do: config.contract_creation_cost

  @spec has_delegate_call?(Configuration.t()) :: boolean()
  def has_delegate_call?(config), do: config.has_delegate_call

  @spec max_signature_s(Configuration.t()) :: atom()
  def max_signature_s(config), do: config.max_signature_s

  @spec fail_contract_creation_lack_of_gas?(Configuration.t()) :: boolean()
  def fail_contract_creation_lack_of_gas?(config), do: config.fail_contract_creation

  @spec extcodesize_cost(Configuration.t()) :: integer()
  def extcodesize_cost(config), do: Configuration.extcodesize_cost(config.fallback_config)

  @spec extcodecopy_cost(Configuration.t()) :: integer()
  def extcodecopy_cost(config), do: Configuration.extcodecopy_cost(config.fallback_config)

  @spec balance_cost(Configuration.t()) :: integer()
  def balance_cost(config), do: Configuration.balance_cost(config.fallback_config)

  @spec sload_cost(Configuration.t()) :: integer()
  def sload_cost(config), do: Configuration.sload_cost(config.fallback_config)

  @spec call_cost(Configuration.t()) :: integer()
  def call_cost(config), do: Configuration.call_cost(config.fallback_config)

  @spec selfdestruct_cost(Configuration.t(), keyword()) :: integer()
  def selfdestruct_cost(config, _params),
    do: Configuration.selfdestruct_cost(config.fallback_config)

  @spec fail_nested_operation_lack_of_gas?(Configuration.t()) :: boolean()
  def fail_nested_operation_lack_of_gas?(config),
    do: Configuration.fail_nested_operation_lack_of_gas?(config.fallback_config)

  @spec exp_byte_cost(Configuration.t()) :: integer()
  def exp_byte_cost(config), do: Configuration.exp_byte_cost(config.fallback_config)

  @spec limit_contract_code_size?(Configuration.t(), integer()) :: boolean()
  def limit_contract_code_size?(config, _),
    do: Configuration.limit_contract_code_size?(config.fallback_config)

  @spec start_nonce(Configuration.t()) :: integer()
  def start_nonce(config), do: Configuration.start_nonce(config.fallback_config)
end