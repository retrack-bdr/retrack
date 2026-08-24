defmodule RetrackWeb.Components.OneDocument do
  use Phoenix.Component

  import RetrackWeb.CoreComponents

  @features [
    %{title: "Collaborative Editing", icon: "hero-user-group"},
    %{title: "Comments", icon: "hero-chat-bubble-left-right"},
    %{title: "PDF Export", icon: "hero-document-arrow-down"},
    %{title: "Email", icon: "hero-envelope"},
    %{title: "Workflow", icon: "hero-cog-6-tooth"},
    %{title: "Audit Trail", icon: "hero-clock"},
    %{title: "API", icon: "hero-code-bracket"},
    %{title: "Version History", icon: "hero-arrow-uturn-left"}
  ]

  def runtime(assigns) do
    assigns = assign(assigns, :features, @features)

    ~H"""
    <!-- MOBILE -->
    <div class="mx-auto flex w-full max-w-md flex-col gap-4 lg:hidden">

      <%= for feature <- Enum.take(@features, 4) do %>
        <.feature feature={feature} />
      <% end %>

      <.document />

      <%= for feature <- Enum.drop(@features, 4) do %>
        <.feature feature={feature} />
      <% end %>

    </div>

    <!-- DESKTOP -->
    <div class="relative mx-auto hidden aspect-square w-full max-w-5xl lg:block">

      <!-- SVG -->
      <svg
        class="absolute inset-0 h-full w-full"
        viewBox="0 0 100 100"
      >
        <defs>
          <marker
            id="arrow"
            markerWidth="6"
            markerHeight="6"
            refX="5"
            refY="3"
            orient="auto"
          >
            <path d="M0,0 L0,6 L6,3 Z" class="fill-primary" />
          </marker>
        </defs>

        <%= for {x, y} <- [
          {50, 8},
          {80, 20},
          {92, 50},
          {80, 80},
          {50, 92},
          {20, 80},
          {8, 50},
          {20, 20}
        ] do %>

          <line
            x1="50"
            y1="50"
            x2={x}
            y2={y}
            stroke="currentColor"
            stroke-width="0.4"
            marker-end="url(#arrow)"
            class="text-base-300"
          />

        <% end %>
      </svg>

      <!-- Top -->
      <div class="absolute left-1/2 top-0 -translate-x-1/2">
        <.feature feature={Enum.at(@features, 0)} />
      </div>

      <div class="absolute right-12 top-12">
        <.feature feature={Enum.at(@features, 1)} />
      </div>

      <div class="absolute right-0 top-1/2 -translate-y-1/2">
        <.feature feature={Enum.at(@features, 2)} />
      </div>

      <div class="absolute bottom-12 right-12">
        <.feature feature={Enum.at(@features, 3)} />
      </div>

      <div class="absolute bottom-0 left-1/2 -translate-x-1/2">
        <.feature feature={Enum.at(@features, 4)} />
      </div>

      <div class="absolute bottom-12 left-12">
        <.feature feature={Enum.at(@features, 5)} />
      </div>

      <div class="absolute left-0 top-1/2 -translate-y-1/2">
        <.feature feature={Enum.at(@features, 6)} />
      </div>

      <div class="absolute left-12 top-12">
        <.feature feature={Enum.at(@features, 7)} />
      </div>

      <div class="absolute left-1/2 top-1/2 w-80 -translate-x-1/2 -translate-y-1/2">
        <.document />
      </div>

    </div>
    """
  end

  attr(:feature, :map, required: true)

  defp feature(assigns) do
    ~H"""
    <div class="flex w-40 flex-col items-center rounded-lg border border-base-300 bg-base-100 p-4 shadow-sm">

      <.icon
        name={@feature.icon}
        class="mb-2 h-6 w-6 text-primary"
      />

      <span class="text-center text-sm font-medium">
        {@feature.title}
      </span>

    </div>
    """
  end

  defp document(assigns) do
    ~H"""
    <div class="rounded-xl border border-primary bg-base-100 p-8 shadow-xl">

      <div class="flex flex-col items-center gap-4">

        <.icon
          name="hero-document-text"
          class="h-16 w-16 text-primary"
        />

        <h2 class="text-center text-2xl font-bold">
          Business Document
        </h2>

        <p class="text-center opacity-70">
          The single source of truth for your business workflow.
        </p>

      </div>

    </div>
    """
  end
end
