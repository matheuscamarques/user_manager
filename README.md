# UserManager
Distributed user manager with pubsub, libcluster and ets memory save to create your user management

![image](https://github.com/matheuscamarques/user_manager/assets/37029621/e9c31698-c6ce-40ed-a576-9fd149382651)

This job is responsible for CRUD users in its in-memory database (prioritively), when the user is successfully created we emit the event that created the user to the other nodes via Phoenix.PubSub. Using the LibCluster library we can make these nodes work together to create an easily scalable, fault-tolerant and high-performance User Manager.

# Youtube Séries

### #98 Remote Procedure Call with Elixir by @matheuscamarques
[![Remote Procedure Call with Elixir by @matheuscamarques](http://img.youtube.com/vi/-vEcA2fxoKE/0.jpg)](http://www.youtube.com/watch?v=-vEcA2fxoKE "#1")

### #42 Briefing on UserManager within the Elixir Project by @matheuscamarques
[![Briefing on UserManager within the Elixir Project by @matheuscamarques](http://img.youtube.com/vi/hbnPuopmukI/0.jpg)](http://www.youtube.com/watch?v=hbnPuopmukI "#2")

### #26 Overview of the User Management project code, bug bonuses by @matheuscamarques
[![Overview of the User Management project code, bug bonuses by @matheuscamarques](http://img.youtube.com/vi/gHLUctJ6ups/0.jpg)](http://www.youtube.com/watch?v=gHLUctJ6ups "#3")

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `user_manager` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:user_manager, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/user_manager>.

